const { sign, verify } = require('jsonwebtoken');

const generateToken = (payload) => {
  return sign(payload, process.env.JWT_SECRET, { expiresIn: '1d' });
};

const validateToken = (token) => {
  return verify(token, process.env.JWT_SECRET);
};

module.exports = { generateToken, validateToken };
