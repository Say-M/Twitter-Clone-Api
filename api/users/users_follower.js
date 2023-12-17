const { Router } = require('express');
const router = Router();
const client = require('../../db/client');
router.get('/followers/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.query;
    const get_user_followers = await client.query(
      'SELECT get_user_followers($1,$2)',
      [id, JSON.parse(status)]
    );
    let result = get_user_followers?.rows[0]?.get_user_followers?.status;
    // console.log(get_user_followers?.rows[0]?.get_user_followers);
    if (result === 'success') {
      res.status(200).json({
        user_followers:
          get_user_followers?.rows[0]?.get_user_followers?.follower,
      });
    } else res.status(200).json({ mgs: 'user not found' });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .send({ error, message: error?.message || 'Something went wrong' });
  }
});
module.exports = router;
