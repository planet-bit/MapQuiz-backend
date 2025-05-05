const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール

router.get("/", async (req, res) => {
  try {
    const [results] = await pool.query(
      "SELECT * FROM countries WHERE country_code IN (?, ?)",
      ['kr', 'ru']
    );
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: "データ取得に失敗しました" });
  }
});

module.exports = router;
