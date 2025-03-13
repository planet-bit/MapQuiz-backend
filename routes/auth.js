const router = require("express").Router();
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
const pool = require("../db.cjs");
const JWT = require("jsonwebtoken")
const authMiddleware = require("../middleware/auth");

console.log("pool の内容:", pool);

router.get("/", (req, res) => {
  res.send("Hello Authjs");
})

// ユーザー新規登録用のAPI
router.post("/register", 
  body("email").isEmail(), 
  body("password").isLength({ min:6 }),
  async (req, res) => {
    let connection;
    console.log("受け取ったデータ:", req.body);

    try {
      const email = req.body.email;
      const password = req.body.password;

      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }

      // connectionをプールから取得
      connection = await pool.getConnection();

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
      await connection.execute(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [email, hashedPassword]
      );
      
      //クライアントへJWTの発行
      const token = await JWT.sign({
          email,
        },
        process.env.SECRET_KEY,
        {
          expiresIn: "24h",
        }
      );
      
      res.cookie("token", token, {
        httpOnly: false,
        secure: false,
        sameSite: "Strict",
      });
    
      res.json({ message: "登録成功", token });
   

    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ error: "サーバーエラーが発生しました。", details: error.message });
    } finally {
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

    // データベースからユーザーを取得
    const [rows] = await connection.execute(
      "SELECT * FROM users WHERE email = ?",
      [email]
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
    const token = await JWT.sign(
      { email },
      process.env.SECRET_KEY, 
      { expiresIn: "24h" }
    );

    res.cookie("token", token, {
      httpOnly: false,
      secure: false,
      sameSite: "Strict",
    });
  
    res.json({ message: "登録成功", token });

  } catch (error) {
    console.error("Login Error:", error);
    res.status(500).json({ error: "サーバーエラーが発生しました。" });
  } finally {
    if (connection) connection.release();
  }
});

router.get("/me", authMiddleware, async (req, res) => {
  try {
    return res.json({ user: req.user });
  } catch (error) {
    return res.status(500).json({ error: "サーバーエラー" });
  }
});

module.exports = router;