const router = require("express").Router();  // Expressのルーターを作成
const pool = require("../db.cjs"); // データベース接続のプール

  router.post('/', async (req, res) => {
    const { user_id, region_id, is_correct, game_type } = req.body;
  
    if (
      user_id == null ||
      region_id == null ||
      typeof is_correct !== 'boolean' ||
      !game_type
    ) {
      return res.status(400).json({ error: '不正なリクエストです' });
    }
  
    try {
      const sql = `
        INSERT INTO user_answers (user_id, region_id, is_correct, game_type)
        VALUES (?, ?, ?, ?)
      `;
      await pool.query(sql, [user_id, region_id, is_correct, game_type]);
      res.status(201).json({ message: '回答を記録しました' });
    } catch (err) {
      console.error('DB挿入エラー:', err);
      res.status(500).json({ error: 'データベースに記録できませんでした' });
    }
  });

module.exports = router;