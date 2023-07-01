const User = require("../models/User");
const bcrypt=require('bcrypt');

const createUser=async(req,res)=>{
    try{
        const {name,email,password} = req.body;
        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(400).json({message:"User already exists with the same email"});
        }
        const hash=await bcrypt.hash(password,10);
        let user=new User({
            email,
            password:hash,
            name
        });
        user=await user.save();
        return res.status(200).json(user);
    }catch(error){
        console.log(error);
        return res.status(500).json({error:error.message});
    }
}

module.exports={
    createUser
}