const express = require("express");
const router = express.Router();
const db = require("../conf/database");
const errorPrint = require("../helpers/debug/debugHelper").errorPrint;
const successPrint = require("../helpers/debug/debugHelper").successPrint;
const userError = require("../helpers/errors/userError");
//hash user's passwords
const bcrypt = require("bcrypt");
const saltRounds = 10;
//validates incoming data
const { check, validationResult } = require("express-validator");

//==============================================  [REGISTRATION]  ==============================================
const validateRegistration = [
  check("email", "Authentic email is required.") //Express Validator [EMAIL]
    .notEmpty()
    .isEmail(),
  check("username", "Username is required.") //Express Validator [USERNAME]
    .notEmpty(),
  check("password", "Password length must be at least 8 characters.") //Express Validator [PASSWORD]
    .notEmpty()
    .isLength({ min: 8 }),
  check("confirm_password", "Password confirmation is required.") //Express Validator [PASSWORD CONFIRMATION]
    .notEmpty()
    .custom((value, { req, loc, path }) => {
      if (value !== req.body.confirm_password)
        throw new Error("Password Confirmation does not match Password.");
      else return value;
    }),
  check("ageVerification", "Users must be 13 years or older.") //Express Validator [AGE VERIFICATION]
    .equals("Yes"),
  check(
    "LegalRequirements",
    "Users must accept the Terms of Service & Privacy Policy."
  ) //Express Validator [ACCEPTS TERMS AND CONDITIONS]
    .equals("Yes"),
];

router.post("/register", validateRegistration, (req, res, next) => {
  const errors = validationResult(req); //Express Validation
  if (!errors.isEmpty()) {
    return res.json({ message: errors.array()[0].msg });
  }

  console.log(req.body);
  let email = req.body.email;
  let username = req.body.username;
  let password = req.body.password;

  db.execute("SELECT * FROM users WHERE username=?", [username]) //Validates if the username is unique
    .then(([results, fields]) => {
      if (results && results.length == 0) {
        return db.execute("SELECT * FROM users WHERE email=?", [email]);
      } else {
        res.json({
          status: "ERROR",
          message: "Failed Registration: username already exists",
        });
        // throw new userError('Failed Registration: username already exists', '/registration', 200);
      }
    })
    .then(([results, fields]) => {
      if (results && results.length == 0) {
        return bcrypt.hash(password, saltRounds);
      } else {
        res.json({
          status: "ERROR",
          message: "Failed Registration: email already exists",
        });
        // throw new userError('Failed Registration: email already exists', '/registration', 200); //Validates if the email is unique
      }
    })
    .then((hashedPassword) => {
      let baseSQL =
        "INSERT INTO users (username, email, password, created) VALUES (?, ?, ?, now())";
      return db.execute(baseSQL, [username, email, hashedPassword]);
    })
    .then(([results, fields]) => {
      if (results && results.affectedRows) {
        successPrint("user has been created");
        res.redirect("/login");
      } else {
        res.json({ status: "ERROR", message: "Server: user was not created" });
        //throw new userError('Server Error: User was not created', '/registration', 500);
      }
    })
    .catch((err) => {
      next(err);
    });
});

//==============================================  [LOGIN]  ==============================================
router.post("/auth", (req, res, next) => {
  console.log(req.body);
  let username = req.body.username;
  let password = req.body.password;
  let userID;

  db.execute("SELECT id, password FROM users WHERE username = ?", [username])
    .then(([results, fields]) => {
      if (results && results.length == 1) {
        let dbHashedPassword = results[0].password;
        userID = results[0].id;
        return bcrypt.compare(password, dbHashedPassword); //compares stored hash password with user inputted password
      }
    })
    .then((passwordsMatch) => {
      if (passwordsMatch) {
        successPrint("Login Successful");
        req.session.username = username;
        req.session.userID = userID;
        res.json({ status: "OK", message: "Login Successful" });
      } else {
        console.log(req._body);
        console.log(username);
        res.json({
          status: "ERROR",
          message: "Username and Password do not match",
        });
      }
    })
    .catch((err) => {
      next(err);
    });
});

//==============================================  [LOGOUT]  ==============================================
router.post("/logout", (req, res, next) => {
  req.session.destroy((err) => {
    if (err) {
      errorPrint("Failed to destroy session");
      next(err);
    } else {
      successPrint("Session has been destroyed");
      res.clearCookie("csid");
      res.redirect("/");
    }
  });
});

module.exports = router;
