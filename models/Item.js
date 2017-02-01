const mongoose = require('mongoose');
const clothesSchema = new mongoose.Schema({
  name: String,
  size: String,
  type: String,
  material: String,
  color: String
});
