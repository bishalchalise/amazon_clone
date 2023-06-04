//imports for packages
const express = require("express");
const mongoose = require("mongoose");

// import form other files
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");


//init
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://bishalise:B09d24cr2016!@cluster0.yrpburk.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//conection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at ${PORT}`);
});
