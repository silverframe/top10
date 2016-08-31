var Twitter = require('twitter');
var express = require('express');
var bodyParser = require('body-parser')
var app = express()
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.get('/', function(req,res) {
  console.log(req.query)
  getTrends(req,res)
})
app.get('/locations', function(req,res) {
  console.log("find places")
  getLocations(req,res)
})

var client = new Twitter({
  consumer_key: 'dkXuJsgk4AWHHYvHi3Cpw8NDO',
  consumer_secret: 'ZcIC5zdA92HjtBtvliR1MF0EsXUHXT92lhKGYI8EqiRp1qEJiR',
  access_token_key: '726426004818825217-mzeCuVldhEKFnfiCfnG4FCY47nDqDkY',
  access_token_secret: '3BpkZqHgKmIl17GEkHL1FmyNuJNt1hMoxlEVYF51pLxzo'
});

function getTrends(req,res) {
  var params = req.query
  client.get('trends/place.json', params, function(error, tweets, response){
    res.json(tweets[0])

  })
}

function getLocations(req,res) {
  // var params = {"id": 1};
  console.log("find")
  client.get('trends/available.json', function(error, locations, response){
    res.json(locations)
  })
}

app.listen(3000)
