const { Router } = require("express");
const router = Router();
const authRouters = require("./auth/index");
const tweetRouters = require("./actions/index");
router.use("", authRouters);
router.use("", tweetRouters);
module.exports = router;
