const mysql = require("mysql2");

const pool = mysql.createPool({
  HOST: "us-cdbr-east-05.cleardb.net",
  USER: "baa67751583ddf",
  PASSWORD: "4dd8dc35",
  DB: "heroku_98a05bc21c9369f",
});

const promisePool = pool.promise();
module.exports = promisePool;
