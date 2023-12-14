const { Router } = require("express");
const router = Router();
const authRouters = require("./auth/index");
const tweetRouters = require("./actions/index");
const userRouters = require("./users/index");
router.use("", authRouters);
router.use("", tweetRouters);
router.use("", userRouters);
module.exports = router;
