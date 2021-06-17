var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var bodyParser = require("body-parser");
var session = require("express-session");
var mysqlStore = require("express-mysql-session")(session);

var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
var postsRouter = require("./routes/posts");
var app = express();

app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.urlencoded({ extended: false }));

var sessionStore = new mysqlStore(
  {
    /* using default options */
  },
  require("./conf/database")
);

var sessionOptions = {
  key: "csid",
  secret: "this is a secret for csc317",
  store: sessionStore,
  cookie: { secure: false, httpOnly: false, maxAge: 9000000 },
  resave: false,
  saveUninitialized: false,
};

app.use(session(sessionOptions));
app.use(cookieParser());
app.use("/public", express.static(path.join(__dirname, "public")));
app.set("trust proxy", 1); // trust first proxy

//Express Validator Middleware
app.use(express.json());
app.post("/user", (req, res) => {
  User.create({
    username: req.body.username,
    password: req.body.password,
  }).then((user) => res.json(user));
});

//Routes
app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/posts", postsRouter);

//DB Error
app.use((err, req, res, next) => {
  console.log(err);
  res.status(500);
  res.send("ERROR: something went wrong with your database.");
});

module.exports = app;
