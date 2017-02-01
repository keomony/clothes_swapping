const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const db = mongoose.connection;

mongoose.connect('mongodb://localhost/clothes_swapping_test');
db.on('error', console.error.bind(console, 'connection error'));
db.once('open', function() {

})

app.use(bodyParser.urlencoded({extended: true}))

app.listen(3000, function(){
  console.log('listening on 3000');
})

app.get('/', function (request, response){
  response.sendFile(__dirname + '/index.html');
})

app.post('/items', (request, response) => {
  console.log(request.body);
})
