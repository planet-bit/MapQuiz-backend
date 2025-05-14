const mysql = require("mysql2/promise"); // promise ベースのmysql2を使う
require("dotenv").config({ path: '.env' });

const pool = mysql.createPool({
  host: process.env.DB_HOST || "mapquiz-mysql",
  user: process.env.DB_USER || "user",
  password: process.env.DB_PASSWORD || "password",
  database: process.env.DB_NAME || "mapquizdb",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool;
