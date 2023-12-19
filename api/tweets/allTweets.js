const { Router } = require('express');
const router = Router();
const client = require('../../db/client');
router.get('', async (req, res) => {
  try {
    const { page = 1, limit = 10 } = req.query;

    const result = await client.query('SELECT get_tweets($1, $2)', [
      page,
      limit,
    ]);
    if (result?.rows[0]?.get_tweets?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.get_tweets,
        message: 'Something went wrong',
      });
    }
    res.send(result?.rows[0]?.get_tweets);
  } catch (error) {
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});
module.exports = router;
