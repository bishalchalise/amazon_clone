const express = require("express");
const admin = require("../middleware/admin");
const {Product} = require("../models/product");

const adminRouter = express.Router();
//add product

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, quantity, images, category, price } = req.body;

    let product = new Product({
      name,
      description,
      quantity,
      images,
      category,
      price,
    });

    product = await product.save();
    res.json(product);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

//get all product

adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
