const jwt=require('jsonwebtoken');

const checkToken=(req,res,next)=>{
    try{
        const authHeader = req.headers.authorization;
        if(!authHeader){
            return res.status(401).json({message:'Authorization header is missing'});
        }
        const token=req.headers.authorization.split(" ")[1];
        if(!token){
            return res.status(401).json({message:'Token not present'});
        }
        let verify = jwt.verify(token,'secret');
        if(!verify){
            return res.status(401).json({message:'Invalid token'});
        }
        req.userID=verify.id;
        req.token=token;
        next();
    }catch(error){
        return res.status(401).json({message:'Invalid token'});
    }
}

module.exports={
    checkToken
}