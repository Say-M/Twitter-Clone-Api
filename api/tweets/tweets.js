const { Router } = require('express');
const router = Router();
const client = require('../../db/client');

router.post('', async (req, res) => {
  try {
    const createTweet = await client.query('SELECT tweetcreate($1)', [
      req.body,
    ]);
    if (createTweet?.rows[0]?.tweetcreate?.status === 'success') {
      return res.status(200).json({
        operation: 'success',
        tweet: createTweet?.rows[0]?.tweetcreate?.tweet,
      });
    } else {
      return res.status(400).json({ msg: 'something went wrong' });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).send({ error, message: 'Something went wrong' });
  }
});
module.exports = router;

router.patch('/:id', async (req, res) => {
  try {
    const updateTweet = await client.query('SELECT tweet_update($1,$2)', [
      req.params.id,
      req.body,
    ]);
    if (updateTweet?.rows[0]?.tweet_update?.status === 'success') {
      return res.status(200).json({
        operation: 'success',
        tweet: updateTweet?.rows[0]?.tweet_update?.tweet,
      });
    } else {
      return res.status(400).json({ msg: 'something went wrong' });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).send({ error, message: 'Something went wrong' });
  }
});
