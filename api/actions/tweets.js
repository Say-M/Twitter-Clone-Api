const { Router } = require("express");
const router = Router();
const client = require("../../db/client");
const { tokenVerification } = require("../../middleware/verification");
router.post("", tokenVerification, async (req, res) => {
  // console.log(req.body);
  try {
    // console.log(req.body);
    const createTweet = await client.query("SELECT tweetcreate($1)", [
      req.body,
    ]);
    // console.log(createTweet?.rows[0]?.tweetcreate?.status);
    if (createTweet?.rows[0]?.tweetcreate?.status === "success") {
      return res.status(200).json({
        operation: "success",
        tweet: createTweet?.rows[0]?.tweetcreate?.tweet,
      });
    } else {
      return res.status(400).json({ msg: "something went wrong" });
    }
  } catch (e) {
    console.log(e);
    return res.status(400).json({ msg: "something went wrong,error" });
  }
});
module.exports = router;
