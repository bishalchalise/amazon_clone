const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const { hash } = require("bcrypt");
const authRouter = express.Router();

//signup route
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    console.log(req.body);
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "The user already exists!" });
    }

   const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password : hashedPassword  ,
      name,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = authRouter;
