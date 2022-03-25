const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "us-cdbr-east-05.cleardb.net",
  user: "baa67751583ddf",
  password: "4dd8dc35",
  database: "heroku_98a05bc21c9369f",
});

const promisePool = pool.promise();
module.exports = promisePool;
