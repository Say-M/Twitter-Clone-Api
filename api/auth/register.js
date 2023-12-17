const { Router } = require('express');
const router = Router();
const { hashPassword } = require('../../utils/password');
const client = require('../../db/client');

router.post('/register', hashPassword, async (req, res) => {
  try {
    req.body.username = req.body.username.toLowerCase();
    req.body.email = req.body.email.toLowerCase();
    const data = req.body;
    const result = await client.query('SELECT register($1)', [data]);
    if (result?.rows[0]?.register?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.register,
        message: 'Something went wrong',
      });
    }
    res.status(201).send(result?.rows[0]?.register);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});

module.exports = router;
