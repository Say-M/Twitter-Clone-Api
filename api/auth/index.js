const { Router } = require("express");
const router = Router();
const login = require("./login");
const register = require("./register");
const logout = require("./logout");
router.use("/auth", login);
router.use("/auth", register);
router.use("/auth", logout);
module.exports = router;
