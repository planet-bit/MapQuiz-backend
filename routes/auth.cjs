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
router.post(
  "/register",
  [
    body("user_name").notEmpty().withMessage("ユーザーネームは必須です"),
    body("password").isLength({ min: 6 }).withMessage("パスワードは6文字以上必要です")
  ],
  async (req, res) => {
    let connection;

    try {
      const { password, user_name } = req.body;

      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }

      connection = await pool.getConnection();

      // user_name が重複していないかチェック
      const [existing] = await connection.execute(
        "SELECT COUNT(*) AS count FROM users WHERE user_name = ?",
        [user_name]
      );
      if (existing[0].count > 0) {
        return res.status(400).json({ error: "このユーザーネームは既に使用されています。" });
      }

      const hashedPassword = await bcrypt.hash(password, 12);

      const [result] = await connection.execute(
        "INSERT INTO users (user_name, password) VALUES (?, ?)",
        [user_name, hashedPassword]
      );

      const user_id = result.insertId;

      const [countries] = await connection.execute("SELECT country_code FROM countries");
      const gameTypes = ["location", "letter"];

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

      await Promise.all(insertPromises);

      const [userRows] = await connection.execute(
        "SELECT user_id, user_name, role_id FROM users WHERE user_id = ?",
        [user_id]
      );
      const user = userRows[0];

      const token = JWT.sign(
        {
          id: user.user_id,
          user_name: user.user_name,
          role_id: user.role_id
        },
        process.env.SECRET_KEY,
        { expiresIn: "24h" }
      );

      res.cookie("token", token, {
        httpOnly: false,
        secure: false,
        sameSite: "Strict"
      });

      res.json({ message: "ログイン成功", token, id: user_id });
    } catch (error) {
      res.status(500).json({ error: "サーバーエラーが発生しました。", details: error.message });
    } finally {
      if (connection) connection.release();
    }
  }
);

//ログイン用のAPI
router.post("/login", async (req, res) => {
  let connection;
  try {
    connection = await pool.getConnection();
    const { user_name, password } = req.body;

    // ユーザーネームで検索
    const [rows] = await connection.execute(
      "SELECT user_id, password, user_name, role_id FROM users WHERE user_name = ?",
      [user_name]
    );

    if (rows.length === 0) {
      return res.status(400).json({ error: "そのユーザーは存在しません。" });
    }

    const user = rows[0];

    // パスワードの照合
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ error: "パスワードが異なります。" });
    }

    // JWTの発行
    const token = JWT.sign(
      {
        id: user.user_id,
        user_name: user.user_name,
        role_id: user.role_id
      },
      process.env.SECRET_KEY,
      { expiresIn: "24h" }
    );
    
    res.cookie("token", token, {
      httpOnly: false,
      secure: false,
      sameSite: "Strict",
    });

    res.json({ message: "ログイン成功", token, id: user.user_id });

  } catch (error) {
    console.error("Login Error:", error);
    res.status(500).json({ error: "サーバーエラーが発生しました。" });
  } finally {
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