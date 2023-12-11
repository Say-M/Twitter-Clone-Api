const { Router } = require("express");
const { generateToken, attachCookiesToResponse } = require("../../utils/token");
const { checkPassword } = require("../../utils/password");
const router = Router();
const client = require("../../db/client");

router.post("/login", async (req, res) => {
  req.body.username = req.body?.username?.toLowerCase();
  req.body.email = req.body?.email?.toLowerCase();
  const data = req.body;

  try {
    const passwordResult = await client.query("SELECT get_password($1)", [
      data,
    ]);
    const passwordResponse = passwordResult.rows[0]?.get_password;
    // console.log(passwordResponse);
    if (!passwordResponse) {
      return res.status(400).send({
        error: "Invalid credentials",
        message: "Invalid credentials",
      });
    }

    if (passwordResponse.status === "failed") {
      return res.status(400).send({
        error: passwordResponse,
        message: "Invalid credentials",
      });
    }

    const userPassword = passwordResponse.password;

    req.user = {
      username: req.body.username,
      email: req.body.email,
      password: userPassword,
    };
    // console.log(req.user);
    // res.send("OK");
    checkPassword(req, res, async () => {
      const result = await client.query("SELECT login($1)", [data]);
      // console.log(result);
      const loginResponse = result.rows[0]?.login;
      // console.log(loginResponse);
      if (!loginResponse) {
        return res.status(400).send({
          error: "Invalid credentials",
          message: "Invalid credentials",
        });
      }

      if (loginResponse.status === "failed") {
        return res.status(400).send({
          error: loginResponse,
          message: "Invalid credentials",
        });
      }
      // console.log(loginResponse);
      const token = generateToken({ id: loginResponse.user?.id });
      attachCookiesToResponse({ res, token });
      res.status(200).send({
        token,
        user: loginResponse,
      });
      // res.send("OK");
    });
  } catch (error) {
    console.error(error);
    res.status(500).send({
      error: error,
      message: "Something went wrong",
    });
  }
});
module.exports = router;
