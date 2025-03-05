const express = require('express');
const mysql = require('mysql2');

const app = express();
const PORT = 3000;

const cors = require('cors');
app.use(cors({
  origin: 'http://localhost:5173', // フロントエンドのURLに合わせてください
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type'],
}));

const db = mysql.createConnection({
  host: 'localhost',  // Dockerなら 'mapquiz-mysql-container'
  user: 'root',
  password: 'k12l23',  // 実際のパスワードを設定
  database: 'geolingo'
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

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
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

app.get('/api/letters', (req, res) => {
  db.query('SELECT * FROM language_letters', (err, results) => {
    if (err) {
      console.error('データ取得エラー:', err);
      res.status(500).json({ error: 'データ取得に失敗しました' });
      return;
    }
    console.log('取得データ:', results); // 追加
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


