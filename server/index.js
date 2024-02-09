//IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');


// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://jonathan:fataMorgana@cluster0.5jkjxha.mongodb.net/"

// MIDDLEWARE  
app.use(express.json());
app.use(authRouter);
//app.use(adminRouter);
//app.use(productRouter);
//app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
