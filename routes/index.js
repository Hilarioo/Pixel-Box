var express = require("express");
var router = express.Router();
var isLoggedIn = require("../middleware/routeprotectors").userIsLoggedIn;

/* GET home page. */
router.get("/", function (req, res, next) {
  res.sendFile("index.html", { root: "public/html" });
});

/* GET login page. */
router.get("/login", function (req, res, next) {
  res.sendFile("login.html", { root: "public/html" });
});

/* Logout - closses user session page. */
router.get("/logout", function (req, res, next) {
  req.logout(); //logs the user out
  req.session.destroy(); //disconnects MySQL DB connection
  res.redirect("/");
});

/* GET registration page. */
router.get("/registration", function (req, res, next) {
  res.sendFile("registration.html", { root: "public/html" });
});

/* GET post image page. */
router.use("/postimage", isLoggedIn);
router.get("/postimage", function (req, res, next) {
  res.sendFile("postimage.html", { root: "public/html" });
});

/* GET privacy policy. */
router.get("/privacy-policy", function (req, res, next) {
  res.sendFile("privacy-policy.html", { root: "public/html" });
});

/* GET terms of use. */
router.get("/terms-of-use", function (req, res, next) {
  res.sendFile("terms-of-use.html", { root: "public/html" });
});

/* GET upload policy. */
router.get("/upload-policy", function (req, res, next) {
  res.sendFile("upload-policy.html", { root: "public/html" });
});

module.exports = router;
