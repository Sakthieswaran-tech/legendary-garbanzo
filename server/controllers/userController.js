const User = require("../models/User");
const bcrypt=require('bcrypt');
const jwt=require('jsonwebtoken');
const { token } = require("morgan");

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

const signInUser=async(req,res)=>{
    try{
        const {email,password}=req.body;
        const user=await User.findOne({email});
        if(!user){
            return res.status(404).json({message:"User not found for the given email"});
        }
        const validUser = await bcrypt.compare(password,user.password);
        if(validUser){
            const token=jwt.sign({id:user._id},'secret', { expiresIn: '10h' })
            return res.status(200).json({...user._doc,token});
        }else{
            return res.status(401).json({message:"Invalid password"});
        }
    }catch(error){
        console.log(error);
        return res.status(500).json({error:error.message});
    }
}

const validateToken=async(req,res)=>{
    try{
        const token=req.headers.authorization.split(" ")[1];
        const verified=jwt.verify(token,'secret');
        if(!verified){
            return res.status(401).json({valid:false});
        }
        const user = await User.findById(verified.id);
        if(!user){
            return res.status(401).json({valid:false});
        }
        return res.status(200).json({valid:true});
    }catch(error){
        console.log(error);
        return res.status(401).json({valid:false});
    }
}

const getUserData=async(req,res)=>{
    try{
        const user = await User.findById({_id:req.userID});
        return res.status(200).json({...user._doc,token:req.token});
    }catch(error){
        console.log(error);
        return res.status(500).json({error:error.message});
    }
}

module.exports={
    createUser,
    signInUser,
    validateToken,
    getUserData
}