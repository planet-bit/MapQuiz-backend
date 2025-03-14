require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;
const pool = require("./db.cjs");

const authRoutes = require("./routes/auth.cjs");
const countriesRoutes = require("./routes/countries.cjs");
const questionsRoutes = require("./routes/questions.cjs");
const lettersRoutes = require("./routes/letters.cjs");

app.use(express.json());
app.use(cors({
  origin: 'http://localhost:5173', // フロントエンドのURL
  methods: ['GET', 'POST', 'OPTIONS'], 
  allowedHeaders: ['Content-Type'],
  credentials: true, // クッキーを送受信するために必要
}));

app.use("/auth", authRoutes);
app.use("/api/countries", countriesRoutes);
app.use("/api/questions", questionsRoutes);
app.use("/api/letters", lettersRoutes);

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

module.exports = pool;