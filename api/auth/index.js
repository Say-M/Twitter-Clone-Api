const { Router } = require('express');
const router = Router();
const login = require('./login');

router.use('/auth', login);

module.exports = router;
