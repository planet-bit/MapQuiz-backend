require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = process.env.PORT || 3000;

const cors = require('cors');
app.use(cors({
  origin: 'http://localhost:5173', 
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type'],
}));

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  charset: 'utf8mb4'
});

// 接続確認
db.connect(err => {
  if (err) {
    console.error('MySQL接続エラー:', err);
    return;
  }
  console.log('MySQL接続成功！');
});

// JSONデータを扱えるようにする
app.use(express.json());


app.get('/', (req, res) => {
  res.send('Hello from MapQuiz Backend');
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

// 国名一覧を取得するAPI
app.get('/api/countries', (req, res) => {
  db.query('SELECT * FROM countries', (err, results) => {
    if (err) {
      console.error('データ取得エラー:', err);
      res.status(500).json({ error: 'データ取得に失敗しました' });
      return;
    }
    res.json(results);
  });
});

// 文字一覧を取得するAPI
app.get('/api/letters', (req, res) => {
  db.query('SELECT * FROM language_letters', (err, results) => {
    if (err) {
      console.error('データ取得エラー:', err);
      res.status(500).json({ error: 'データ取得に失敗しました' });
      return;
    }
    console.log('取得データ:', results);
    res.json(results);
  });
});

app.get('/api/letters/:country', (req, res) => {
  const country = req.params.country;
  db.query('SELECT * FROM language_letters WHERE country_name = ?', [country], (err, results) => {
    if (err) {
      console.error('データ取得エラー:', err);
      res.status(500).json({ error: 'データ取得に失敗しました' });
      return;
    }
    res.json(results);
  });
});

// 問題を取得するAPI
app.get("/api/questions", (req, res) => {
  console.log("クエリパラメータ:", req.query);
  const { country } = req.query;

  if (!country) {
    return res.status(400).json({ error: "Country is required" });
  }

  db.query(
    "SELECT local_name AS word, english_name AS answer FROM places WHERE country_name = ?",
    [country],
    (err, results) => {
      if (err) {
        console.error("データ取得エラー:", err);
        res.status(500).json({ error: "Database error" });
        return;
      }
      if (!results || results.length === 0) {
        return res.status(404).json({ error: "No questions found for this country" });
      }
      res.json(results);
    }
  );
});






