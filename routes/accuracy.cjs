const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール
const authenticateToken = require("../middleware/auth.cjs");

router.get('/', authenticateToken, async (req, res) => {
    const userId = req.user.id;  // ← JWTから取得
    const country = req.query.country;
    const gameType = req.query.game_type;

    console.log("JWT decoded user:", req.user); 
  
    if (!userId || !country || !gameType) {
      return res.status(400).json({ error: 'user_id（JWT）、country、game_typeが必要です' });
    }
  
    try {
      const [rows] = await pool.execute(`
        SELECT
            ua.region_id,
            r.english_name AS region_name,
            COUNT(*) AS total_answers,
            SUM(ua.is_correct) AS correct_answers,
            ROUND(SUM(ua.is_correct) / COUNT(*) * 100, 2) AS accuracy_percentage
        FROM user_answers ua
        JOIN regions r ON ua.region_id = r.region_id
        WHERE ua.user_id = ? AND ua.game_type = ? AND r.country_code = ?
        GROUP BY ua.region_id, r.english_name
      `, [userId, gameType, country]);
  
      res.json({
        country,
        game_type: gameType,
        regions: rows
      });
    } catch (err) {
      console.error('Error in region-accuracy API:', err);
      res.status(500).json({ error: 'Server error' });
    }
  });
  
  
module.exports = router;