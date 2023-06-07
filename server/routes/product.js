const express = require("express");
const auth = require("../middleware/auth");
const Product = require("../models/product");

const productRouter = express.Router();


productRouter.get("/api/products", auth, async (req, res) => {
    try {
   
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  module.exports = productRouter; 