const express=require('express');
const { createUser, signInUser } = require('../controllers/userController');
const router=express.Router();

router.route('/api/signup').post(createUser);
router.route('/api/signin').post(signInUser)
module.exports=router;