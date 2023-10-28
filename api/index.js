const { Router } = require('express');
const router = Router();
const authRouters = require('./auth/index');

router.use('', authRouters);

module.exports = router;
