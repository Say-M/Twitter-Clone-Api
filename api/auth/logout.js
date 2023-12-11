const { Router } = require("express");
const router = Router();
router.get("/logout", async (req, res) => {
  res.cookie("accessToken", "logout", {
    httpOnly: true,
    // expires: new Date(Date.now() + 5 * 10000),
    expires: new Date(Date.now()),
  });
  res.status(200).json({ msg: "user logged out!" });
});
module.exports = router;
