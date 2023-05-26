const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    required: true,
    unique: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
        /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
        return value.match(re);
      },
      message: "Please Enter a valid Email Address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  //cart
});

const User = mongoose.model("User", userSchema);
module.exports = User;
