const router = require("express").Router();
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
const pool = require("../db.cjs");

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
      let hashedPassword = await bcrypt.hash(password, 10);
      console.log(hashedPassword);

      // ユーザー情報のデータベースに挿入
      await connection.execute(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [email, hashedPassword]
      );

      res.json({ message: "ユーザー登録が完了しました！" });
    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ error: "サーバーエラーが発生しました。", details: error.message });
    } finally {
      // connectionを確実に解放
      if (connection) connection.release();
    }
  }
);

module.exports = router;






module.exports = router;