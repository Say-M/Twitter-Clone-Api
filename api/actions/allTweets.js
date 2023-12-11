const { Router } = require("express");
const router = Router();
const client = require("../../db/client");
router.get("", async (req, res) => {
  try {
    const getTweets = await client.query("SELECT all_tweets();");
    const all_tweets = getTweets?.rows[0]?.all_tweets?.tweets;
    console.log(getTweets?.rows[0]?.all_tweets?.tweets);
    return res.status(200).json({
      total: all_tweets.length,
      tweets: all_tweets,
    });
  } catch (e) {
    return res.status(400).json({ msg: "failed" });
  }
});
module.exports = router;
