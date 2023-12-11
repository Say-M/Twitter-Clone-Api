const { Router } = require("express");
const router = Router();
const tweet = require("./tweets");
const allTweets = require("./allTweets");
router.use("/action", tweet);
router.use("/action", allTweets);
module.exports = router;
