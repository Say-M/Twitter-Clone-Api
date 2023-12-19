const client = require('../db/client');
const getCookie = require('../utils/getCookie');
const { validateToken } = require('../utils/token');

const tokenVerification = async (req, res, next) => {
  try {
    const token = req.headers.authorization.split(' ')[1];
    const decoded = validateToken(token);
    if (!decoded) return res.status(401).send({ message: 'Unauthorized' });

    const result = await client.query('SELECT userProfile($1)', [decoded.id]);
    // console.log(result);
    if (result?.rows[0]?.userprofile?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.userprofile,
        message: 'Invalid credentials',
      });
    }
    // console.log(result?.rows[0]?.userprofile?.user?.id);
    res.user = result?.rows[0]?.userprofile?.user;
    next();
  } catch (error) {
    console.error(error);
    res.status(401).send({ error, message: 'Unauthorized' });
  }
};

module.exports = { tokenVerification };
