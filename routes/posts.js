var express = require("express");
var router = express.Router();
const db = require("../conf/database");
const errorPrint = require("../helpers/debug/debugHelper").errorPrint;
const successPrint = require("../helpers/debug/debugHelper").successPrint;
const { check, validationResult } = require("express-validator");
const multer = require("multer");
const sharp = require("sharp");
const crypto = require("crypto");

//==============================================  [UPLOAD POST]  ==============================================
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/images/uploads");
  },
  filename: function (req, file, cb) {
    let fileExt = file.mimetype.split("/")[1];
    let randomName = crypto.randomBytes(22).toString("hex");
    cb(null, `${randomName}.${fileExt}`);
  },
});

var upload = multer({ storage: storage });

const validateUploadPost = [
  check("title", "Title cannot be empty") //Express Validator [EMAIL]
    .notEmpty(),
  check("description", "Description cannot be empty") //Express Validator [EMAIL]
    .notEmpty(),
  check("image", "Please select and image.") //Express Validator [EMAIL]
    .notEmpty(),
  check("acceptableUsePolicy", "You must agree to our policy") //Express Validator [EMAIL]
    .equals("Yes"),
];

router.post(
  "/createPost",
  upload.single("uploadImage"),
  validateUploadPost,
  (req, res, next) => {
    let fileUploaded = req.file.path;
    let fileAsThumbnail = `thumbnail-${req.file.filename}`;
    let destOfThumbnail = req.file.destination + "/" + fileAsThumbnail;
    let title = req.body.title;
    let description = req.body.description;
    let fk_userid = req.session.userID;

    sharp(fileUploaded)
      .resize(205, 140) //resize the image 200px x 200px
      .toFile(destOfThumbnail)
      .then(() => {
        let baseSQL =
          "INSERT INTO posts (title, description, photopath, thumbnail, created, fk_userid) VALUE (?, ?, ?, ?, now(), ?);";
        return db.execute(baseSQL, [
          title,
          description,
          fileUploaded,
          destOfThumbnail,
          fk_userid,
        ]);
      })
      .then(([results, fields]) => {
        if (results && results.affectedRows) {
          successPrint("new post created");
          res.json({
            status: "OK",
            message: "post was created",
            redirect: "/",
          });
        } else {
          res.json({
            status: "OK",
            message: "post was not created",
            redirect: "/postimage",
          });
        }
      })
      .catch((err) => {
        next(err);
      });
  }
);

//==============================================  [SEARCH FOR POST]  ==============================================
router.get("/search/:searchTerm", (req, res, next) => {
  let searchTerm = req.params.searchTerm;
  let baseSQL =
    "SELECT p.id, p.title, p.description, p.thumbnail, u.username \
                   FROM posts p \
                   JOIN users u on p.fk_userid = u.id \
                   WHERE title LIKE ?;";
  searchTerm = "%" + searchTerm + "%";
  db.query(baseSQL, [searchTerm])
    .then(([results, fields]) => {
      res.json(results);
    })
    .catch((err) => next(err));
});

//==============================================  [SHOW RECENT 8 POSTS]  ==============================================
router.get("/getRecentPosts", (req, res, next) => {
  let baseSQL =
    "SELECT p.id, p.title, p.description, p.thumbnail, u.username, p.created \
                   FROM posts p \
                   JOIN users u on p.fk_userid = u.id \
                   ORDER BY p.created DESC \
                   LIMIT 8 \
                   ";

  db.query(baseSQL)
    .then(([results, fields]) => {
      res.json(results);
    })
    .catch((err) => next(err));
});

router.get("/imagepost/:id", (req, res, next) => {
  res.sendFile("imagepost.html", { root: "public/html" });
});

//==============================================  [FETCHES POST DETAILS]  ==============================================
router.get("/getPostById/:id", (req, res, next) => {
  let _id = req.params.id;

  let baseSQL =
    "SELECT p.id, p.title, p.description, p.photopath, u.username, p.created \
    FROM posts p \
    JOIN users u on p.fk_userid = u.id \
    WHERE p.id = ?";

  db.query(baseSQL, _id)
    .then(([results, fields]) => {
      res.json(results[0]);
    })
    .catch((err) => next(err));
});

//==============================================  [COMMENT ON POSTS]  ==============================================
const validateRegistration = [
  check("comment", "Comment cannot be empty.") //Express Validator [COMMENT]
    .notEmpty(),
];

router.post("/submitComment", validateRegistration, (req, res, next) => {
  let comment = req.body.comment;
  let fk_userid = req.session.userID;
  let fk_postid = req.body.fk_postid;

  const errors = validationResult(req); //Express Validation
  if (!errors.isEmpty()) {
    return res.json({ message: errors.array()[0].msg });
  }
  if (fk_userid == null) {
    return res.json({
      status: "ERROR",
      message: "You must sign-in to comment.",
    });
  }

  let baseSQL =
    "INSERT INTO comments (comment, created, fk_userid, fk_postid) VALUE (?, now(), ?, ?);";
  db.execute(baseSQL, [comment, fk_userid, fk_postid])
    .then(([results, fields]) => {
      return res.json({
        status: "OK",
        message: "Your comment has been posted!",
      });
    })
    .catch((err) => {
      next(err);
    });
});

//==============================================  [FETCHES POST'S COMMENTS]  ==============================================
router.post("/getComments", (req, res, next) => {
  let fk_postid = req.body.fk_postid;

  let baseSQL =
    "SELECT c.fk_postid, c.comment, u.username, c.created \
    FROM comments c \
    JOIN users u on c.fk_userid = u.id \
    WHERE c.fk_postid = ? \
    ORDER BY c.created DESC";

  db.query(baseSQL, [fk_postid])
    .then(([results, fields]) => {
      res.json(results);
    })
    .catch((err) => next(err));
});

module.exports = router;
