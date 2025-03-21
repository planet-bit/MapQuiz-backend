require("dotenv").config();  // .envファイルを読み込んで環境変数を設定
const router = require("express").Router();  // Expressのルーターを作成
const { body, validationResult } = require("express-validator");  // 入力データの検証
const bcrypt = require("bcryptjs");  // パスワードのハッシュ化に使用
const pool = require("../db.cjs");  // データベース接続のプール
const JWT = require("jsonwebtoken"); // JWTの生成と検証
const authMiddleware = require("../middleware/auth.cjs");  // 認証ミドルウェア

router.get("/", (req, res) => {
  res.send("Hello Authjs");
})

// ユーザー新規登録用のAPI
router.post("/register", 
  [
    body("email").isEmail(), 
    body("password").isLength({ min:6 })
  ],
  async (req, res) => {
    let connection;

    try {
      const { email, password } = req.body

      // 入力データの検証結果を取得
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }

      // connectionをプールから取得
      connection = await pool.getConnection();
      
      // すでに登録されているメールアドレスか確認
      const [rows] = await connection.execute(
        "SELECT COUNT(*) AS count FROM users WHERE email = ?",
        [email]
      );
      if (rows[0].count > 0) {
        return res.status(400).json({ error: "このメールアドレスは既に登録されています。" });
      }

      // パスワードのハッシュ化
      let hashedPassword = await bcrypt.hash(password, 12);
      console.log(hashedPassword);

      // ユーザー情報のデータベースに挿入
      const [result] = await connection.execute(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [email, hashedPassword]
      );
      
      const user_id = result.insertId;

      // `countries` テーブルから国名を取得
      const [countries] = await connection.execute("SELECT country_code FROM countries");
      
      // game_type は 'location' と 'letter' のみ
      const gameTypes = ['location', 'letter'];

      // 各国、各ゲームタイプの初期データを `user_streaks` に挿入
      const insertPromises = countries.map(async (country) => {
        for (let gameType of gameTypes) {
          const sql = `
            INSERT INTO user_streaks (user_id, game_type, country_code, max_streak, attempts_count, correct_answers_count, updated_at)
            VALUES (?, ?, ?, 0, 0, 0, NOW())
            ON DUPLICATE KEY UPDATE 
              max_streak = GREATEST(max_streak, VALUES(max_streak)),
              attempts_count = attempts_count + 1,
              correct_answers_count = correct_answers_count + VALUES(correct_answers_count),
              updated_at = NOW();
          `;
          const values = [user_id, gameType, country.country_code];
          await connection.execute(sql, values);
        }
      });

      // Promise.allで非同期処理を待つ
      await Promise.all(insertPromises);




      //クライアントへJWTの発行
      const token = JWT.sign(
        { id: user_id, email },
        process.env.SECRET_KEY,
        { expiresIn: "24h" }
      );
      
      res.cookie("token", token, {
        httpOnly: false,  // JavaScriptからクッキーを直接アクセス可能（開発用）
        secure: false,  // 本番環境ではtrueにするべき（httpsを使用する場合）
        sameSite: "Strict",  // クロスサイトリクエストでクッキーを送信しない設定
      });

      res.json({ message: "ログイン成功", token, id: user_id });
    } 

    catch (error) {
      res.status(500).json({ error: "サーバーエラーが発生しました。", details: error.message });
    } 

    finally {
      // connectionを確実に解放
      if (connection) connection.release();
    }
  }
);

//ログイン用のAPI
router.post("/login", async (req, res) => {
  let connection;
  try {
    connection = await pool.getConnection();
    const { email, password } = req.body;

    // すでに登録されているメールアドレスか確認
    const [rows] = await connection.execute(
      "SELECT * FROM users WHERE email = ?",
      [email]
    );

    if (rows.length === 0) {
      return res.status(400).json({ error: "そのユーザーは存在しません。" });
    }

    //users テーブルから取得した、該当するユーザーのデータ
    const user = rows[0];
    console.log("Fetched User:", user);

    // パスワードの照合
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ error: "パスワードが異なります。" });
    }

    // JWTの発行
    const token = JWT.sign(
      { id: user.user_id, email: user.email },
      process.env.SECRET_KEY,
      { expiresIn: "24h" },
    );
    
    res.cookie("token", token, {
      httpOnly: false,
      secure: false,
      sameSite: "Strict",
    });
  
    res.json({ message: "ログイン成功", token, id: user.user_id });

  } 
  
  catch (error) {
    console.error("Login Error:", error);
    res.status(500).json({ error: "サーバーエラーが発生しました。" });
  } 
  
  finally {
    if (connection) connection.release();
  }
});

// ログイン後のユーザー情報を取得するAPI（認証が必要）
router.get("/me", authMiddleware, async (req, res) => {
  try {
    // 認証されたユーザーの情報を返す
    return res.json({ user: req.user });
  } 
  
  catch (error) {
    return res.status(500).json({ error: "サーバーエラー" });
  }
});

// ルータをエクスポートして、他のファイルで使用できるようにする
module.exports = router;