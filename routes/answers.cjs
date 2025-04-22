const express = require("express");
const router = express.Router();
const pool = require("../db.cjs"); // MySQL接続の設定
const authenticateToken = require("../middleware/auth.cjs");

  router.post('/', authenticateToken, async (req, res) => {
    const { region_id, is_correct, game_type } = req.body;
    const user_id = req.user.id; // トークンから取得
    console.log("受け取ったデータ:", req.body);
    if (
      !user_id ||
      !region_id ||
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