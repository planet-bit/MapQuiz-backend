const express = require("express");
const router = express.Router();
const pool = require("../db.cjs"); // MySQL接続の設定

router.post("/update", async (req, res) => {
    const { user_id, game_type, country_code, streak, correct_answers } = req.body;

    if (!user_id || !game_type || !country_code || streak === undefined || correct_answers === undefined) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    try {
        const sql = `
            INSERT INTO user_streaks (user_id, game_type, country_code, max_streak, attempts_count, correct_answers_count, updated_at)
            VALUES (?, ?, ?, ?, 1, ?, NOW())
            ON DUPLICATE KEY UPDATE 
                max_streak = GREATEST(max_streak, VALUES(max_streak)),
                attempts_count = attempts_count + 1,
                correct_answers_count = correct_answers_count + VALUES(correct_answers_count),
                updated_at = NOW();
        `;

        const values = [user_id, game_type, country_code, streak, correct_answers];
        await pool.query(sql, values);

        res.json({ message: "Record updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Database error" });
    }
});

router.get("/get", async (req, res) => {
    const { user_id } = req.query;

    if (!user_id) {
        return res.status(400).json({ error: "Missing user_id" });
    }

    try {
        const sql = `
            SELECT
            us.game_type,
            us.country_code,
            c.country_name,
            us.max_streak,
            us.attempts_count AS total_attempts,
            us.correct_answers_count AS total_correct_answers,
            us.updated_at AS last_updated
            FROM
            user_streaks us
            JOIN
            countries c ON us.country_code = c.country_code
            WHERE
            us.user_id = ?;
        `;
        const [rows] = await pool.query(sql, [user_id]);

        if (rows.length === 0) {
            return res.status(404).json({ error: "No records found for this user." });
        }

        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Database error" });
    }
});


module.exports = router;
