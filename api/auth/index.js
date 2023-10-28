const { Router } = require('express');
const router = Router();
const login = require('./login');
const register = require('./register');

router.use('/auth', login);
router.use('/auth', register);

module.exports = router;
