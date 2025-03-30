const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール

router.get('/:countryCode', async (req, res) => {
  const countryCode = req.params.countryCode;
  try {
    const [rows] = await pool.query(
      'SELECT local_name, geom, properties FROM regions WHERE country_code = ?',
      [countryCode]
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching regions:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;