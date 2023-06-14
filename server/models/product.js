const mongoose = require("mongoose");
const ratingSchema = require("./ratings");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  quantity: {
    type: String,
    required: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  category: {
    type: String,
    required: true,
  },
  price: {
    type: String,
    required: true,
  },
  //ratings
  ratings: [ratingSchema],
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
