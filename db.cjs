require('dotenv').config({ path: '../MapQuiz-env/.env' });
const mysql = require('mysql2');

// MySQLの接続プール（Connection Pool）を作成
const pool = mysql.createPool({
  host: process.env.DB_HOST, 
  port: process.env.DB_PORT, 
  user: process.env.DB_USER, 
  password: process.env.DB_PASSWORD, 
  database: process.env.DB_NAME,

  waitForConnections: true, // 既存の接続がいっぱいのとき、新しい接続が待機するように設定
  connectionLimit: 10,
  queueLimit: 0, // キューの上限なし（0にすると無制限）
  charset: 'utf8mb4',
});


// クエリの実行と接続プールのリリース
const executeQuery = () => {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("接続取得エラー:", err);
      return;
    }
    connection.query('SELECT * FROM countries', (err, results) => {
      if (err) {
        console.error("クエリエラー:", err);
      } else {
        console.log("クエリ結果:", results);
      }
      connection.release();  // クエリ後に接続をリリース
    });
  });
};

module.exports = pool; // 作成した接続プールを他のファイルで使えるようにエクスポート

// クエリ実行
executeQuery();
module.exports = pool; // 作成した接続プールを他のファイルで使えるようにエクスポート
