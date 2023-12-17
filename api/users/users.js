const { Router } = require('express');
const router = Router();
const client = require('../../db/client');

router.get('', async (req, res) => {
  try {
    const { page = 1, limit = 10 } = req.query;

    const result = await client.query('SELECT get_users($1,$2)', [page, limit]);
    if (result?.rows[0]?.get_users?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.get_users,
        message: 'Something went wrong',
      });
    }
    res.send(result?.rows[0]?.get_users);
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});

module.exports = router;
