const { Router } = require("express");
const router = Router();
const single_user = require("./single_user");
const users_follower = require("./users_follower");
router.use("/users", single_user);
router.use("/users", users_follower);
module.exports = router;
