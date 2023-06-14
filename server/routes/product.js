const express = require("express");
const auth = require("../middleware/auth");
const Product = require("../models/product");

const productRouter = express.Router();

productRouter.get("/api/products", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    const products = await Product.find({
      name: { $regex: req.params.name,
      $options: 'i' },
    });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.post("/api/products/ratings", auth, async (req, res)=>{
  try {
    const {id, rating} = req.body; 
    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
      product.ratings.splice(i,1);
      break;
      }
  
      
    }
    const ratingSchema = {
      userId: req.user, 
      rating, 
    }
    product.ratings.push(ratingSchema);
    product = await product.save(); 
    res.json(product); 

  } catch (error) {
    res.status(500).json({error: error.message})
  }
} )

module.exports = productRouter;
