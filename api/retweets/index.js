const { Router } = require('express');
const router = Router();
const client = require('../../db/client');

router.get('/retweet', async (req, res) => {
  try {
    const { page = 1, limit = 10 } = req.query;

    const result = await client.query('SELECT get_retweets($1, $2)', [
      page,
      limit,
    ]);
    if (result?.rows[0]?.get_retweets?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.get_retweets,
        message: 'Something went wrong',
      });
    }
    res.send(result?.rows[0]?.get_retweets);
  } catch (error) {
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});

router.delete('/retweet/:id', async (req, res) => {
  try {
    const result = await client.query('SELECT retweet_delete($1)', [
      req.params.id,
    ]);
    if (result?.rows[0]?.retweet_delete?.status === 'failed') {
      return res.status(400).send({
        error: result?.rows[0]?.retweet_delete,
        message: 'Something went wrong',
      });
    }
    res.send(result?.rows[0]?.retweet_delete);
  } catch (error) {
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});

module.exports = router;
