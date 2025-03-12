require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;
const pool = require("./db.cjs");
const auth = require("./routes/auth");
app.use(express.json());
app.use(cors({
  origin: 'http://localhost:5173', // フロントエンドのURL
  methods: ['GET', 'POST', 'OPTIONS'], 
  allowedHeaders: ['Content-Type'],
}));
app.use("/auth", auth);
app.options('*', cors());
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

(async () => {
  try {
    const connection = await pool.getConnection();
    console.log("✅ MySQL接続成功！");
    connection.release(); // 接続をプールに戻す
  } catch (err) {
    console.error("❌ MySQL接続エラー:", err);
  }
})();

app.get('/', (req, res) => {
  res.send('Hello from MapQuiz Backend');
});



// 国名一覧を取得するAPI
app.get("/api/countries", async (req, res) => {
  try {
    const [results] = await pool.query("SELECT * FROM countries");
    res.json(results);
  } catch (err) {
    console.error("データ取得エラー:", err);
    res.status(500).json({ error: "データ取得に失敗しました" });
  }
});

app.get("/api/letters/:country", async (req, res) => {
  const country = req.params.country;

  try {
    const [results] = await pool.query(
      "SELECT * FROM language_letters WHERE country_name = ?",
      [country]
    );
    res.json(results);
  } catch (err) {
    console.error("データ取得エラー:", err);
    res.status(500).json({ error: "データ取得に失敗しました" });
  }
});

// 問題を取得するAPI
app.get("/api/questions", async (req, res) => {
  console.log("クエリパラメータ:", req.query);
  const { country } = req.query;

  if (!country) {
    return res.status(400).json({ error: "Country is required" });
  }

  try {
    const [results] = await pool.query(
      "SELECT local_name AS word, english_name AS answer FROM places WHERE country_name = ?",
      [country]
    );

    if (!results || results.length === 0) {
      return res.status(404).json({ error: "No questions found for this country" });
    }
    res.json(results);
  } catch (err) {
    console.error("データ取得エラー:", err);
    res.status(500).json({ error: "Database error" });
  }
});

module.exports = pool;