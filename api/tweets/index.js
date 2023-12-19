const { Router } = require("express");
const router = Router();
const tweet = require("./tweets");
const allTweets = require("./allTweets");
router.use("/tweet", tweet);
router.use("/tweet", allTweets);
module.exports = router;
