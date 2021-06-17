const mysql = require("mysql2");

const pool = mysql.createPool({
  HOST: "us-cdbr-east-04.cleardb.com",
  USER: "bfd93c1e393fe5",
  PASSWORD: "a80e4cf9",
  DB: "heroku_f474c0f73045de6",
});

const promisePool = pool.promise();
module.exports = promisePool;
