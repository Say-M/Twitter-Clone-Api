const { compare, hash } = require('bcrypt');

const hashPassword = async (req, res, next) => {
  const { password } = req.body;
  if (!password) return res.status(400).send('Missing password');
  const hashedPassword = await hash(
    password,
    parseInt(process.env.SALT_ROUNDS)
  );
  if (!hashedPassword) return res.status(500).send('Error hashing password');
  req.body.password = hashedPassword;
  next();
};

const checkPassword = async (req, res, next) => {
  const { password } = req.body;
  if (!password) return res.status(400).send('Missing password');
  const isMatched = await compare(password, req.user.password);
  if (!isMatched) return res.status(401).send('Incorrect password');
  next();
};

module.exports = {
  hashPassword,
  checkPassword,
};
