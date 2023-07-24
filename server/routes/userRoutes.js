const express=require('express');
const { createUser, signInUser, validateToken, getUserData } = require('../controllers/userController');
const { checkToken } = require('../middlewares/checktoken');

const router=express.Router();

router.route('/api/signup').post(createUser);
router.route('/api/signin').post(signInUser);
router.route('/api/tokenCheck').get(validateToken);
router.route('/api/user-data').get(checkToken,getUserData);
module.exports=router;