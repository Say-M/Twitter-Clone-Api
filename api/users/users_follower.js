const { Router } = require("express");
const router = Router();
const client = require("../../db/client");
router.get("/followers/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const get_user_followers = await client.query(
      "SELECT get_user_followers($1,$2)",
      [id, []]
    );
    let result = get_user_followers?.rows[0]?.get_user_followers?.status;
    // console.log(get_user_followers?.rows[0]?.get_user_followers);
    if (result === "success") {
      res.status(200).json({
        user_followers:
          get_user_followers?.rows[0]?.get_user_followers?.follower,
      });
    } else res.status(200).json({ mgs: "user not found" });
  } catch (e) {
    res.status(500).json({ mgs: e });
  }
});
module.exports = router;
