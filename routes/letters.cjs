const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール


router.get("/:countryCode", async (req, res) => {
    const countryCode = req.params.countryCode;
    try {
      const [results] = await pool.query(
        "SELECT * FROM language_letters WHERE country_code = ?",
        [countryCode]
      );
      res.json(results);
    } catch (err) {
      res.status(500).json({ error: "データ取得に失敗しました" });
    }
  });

module.exports = router;