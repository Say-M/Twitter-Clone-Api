const { Router } = require('express');
const { generateToken } = require('../../utils/token');
const router = Router();

router.post('/login', checkPassword, async (req, res) => {
  req.body.username = req.body.username.toLowerCase();
  req.body.email = req.body.email.toLowerCase();
  const data = req.body;
  try {
    const result = await client.query('SELECT login($1)', [data]);
    if (result?.rows[0]?.login?.status === 'failed') {
      return res
        .status(400)
        .send({
          error: result?.rows[0]?.login,
          message: 'Invalid credentials',
        });
    }
    const token = generateToken({ id: result?.rows[0]?.login?.user?.id });
    res.status(200).send({
      token,
      user: result?.rows[0]?.login?.user,
    });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});

module.exports = router;
