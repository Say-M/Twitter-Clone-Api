const client = require('../db/client');
const { validateToken } = require('../utils/token');

const tokenVerification = async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ')[1];
    const decoded = validateToken(token);
    if (!decoded) return res.status(401).send({ message: 'Unauthorized' });
    const result = await client.query('SELECT userProfile($1)', [decoded.id]);
    if (result?.rows[0]?.userProfile?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.userProfile,
        message: 'Invalid credentials',
      });
    }
    req.user = result?.rows[0]?.userProfile?.user;
    next();
  } catch (error) {
    console.error(error);
    res.status(401).send({ error, message: 'Unauthorized' });
  }
};

module.exports = { tokenVerification };
