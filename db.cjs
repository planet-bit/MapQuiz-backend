const mysql = require("mysql2/promise"); // promise ベースのmysql2を使う
require("dotenv").config({ path: "../MapQuiz-env/.env" });

const pool = mysql.createPool({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "mapquiz",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool;
