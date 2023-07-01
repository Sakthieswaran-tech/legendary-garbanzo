const express= require('express');
const mongoose=require('mongoose');
require('dotenv').config();

const userRoutes=require('./routes/userRoutes');

const app=express();

app.use(express.json());
app.use('/users',userRoutes);

mongoose.connect(process.env.MONGO_URL).then(()=>{
    console.log('Connected to db');
}).catch(e=>{
    console.log(e);
})
app.listen(5000,"0.0.0.0",()=>{
    console.log("Server running");
})