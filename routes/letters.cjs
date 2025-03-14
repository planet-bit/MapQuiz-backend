const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール


router.get("/:country", async (req, res) => {
    const country = req.params.country;
  
    try {
      const [results] = await pool.query(
        "SELECT * FROM language_letters WHERE country_name = ?",
        [country]
      );
      res.json(results);
    } catch (err) {
      res.status(500).json({ error: "データ取得に失敗しました" });
    }
  });

module.exports = router;