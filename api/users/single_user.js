const { Router } = require('express');
const router = Router();
const client = require('../../db/client');

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    // console.log(id);
    const filter = req.query;
    const get_single_user = await client.query(
      'SELECT * FROM get_user($1,$2)',
      [id, filter]
    );
    // console.log(get_single_user?.rows[0]?.get_user);
    let result = get_single_user?.rows[0]?.get_user?.status;
    if (result === 'success') {
      res.status(200).json({ user: get_single_user?.rows[0]?.get_user?.user });
    } else {
      res.status(200).json({ msg: 'user not found' });
    }
    // const get_single_user=await client.query()
  } catch (e) {
    res.status(200).json({ msg: 'user not found' });
  }
});

module.exports = router;
