const mysql = require("mysql2");

const pool = mysql.createPool({
  HOST: "us-cdbr-east-04.cleardb.com",
  USER: "bf4632bf76d9ee",
  PASSWORD: "e3418020",
  DB: "heroku_b85a72d8a238e2c",
});

const promisePool = pool.promise();
module.exports = promisePool;
