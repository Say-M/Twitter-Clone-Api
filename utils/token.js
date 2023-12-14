const { sign, verify } = require("jsonwebtoken");

const generateToken = (payload) => {
  return sign(payload, process.env.JWT_SECRET, { expiresIn: "1d" });
};

const validateToken = (token) => {
  return verify(token, process.env.JWT_SECRET);
};

const attachCookiesToResponse = ({ res, token }) => {
  console.log(token);
  const oneDay = 1000 * 60 * 60 * 24;
  res.cookie("accessToken", token, {
    httpOnly: true,
    expires: new Date(Date.now() + oneDay),
    secure: process.env.NODE_ENV === "production",
    signed: true,
  });
};

module.exports = { generateToken, validateToken, attachCookiesToResponse };
