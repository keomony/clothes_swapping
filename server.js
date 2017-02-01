const express = require('express');
const app = express();
const bodyParser = require('body-parser')

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
