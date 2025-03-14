const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール

router.get("/", async (req, res) => {
  const { countryCode } = req.query;

  if (!countryCode) {
    return res.status(400).json({ error: "国名が必要です。" });
  }

  try {
    const [results] = await pool.query(
      "SELECT local_name AS word, english_name AS answer FROM places WHERE country_code = ?",
      [countryCode]
    );

    if (!results.length) {
      return res.status(404).json({ error: "この国の問題は見つかりませんでした。" });
    }
    
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: "データ取得に失敗しました" });
  }
});

module.exports = router;
