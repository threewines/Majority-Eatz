// *****************************************************************************
// Server.js - This file is the initial starting point for the Node/Express server.
//
// ******************************************************************************
// *** Dependencies
// =============================================================
var express = require("express");

// Sets up the Express App
// =============================================================
var app = express();
var PORT = process.env.PORT || 8080;

// Requiring our models for syncing
var db = require("./models");

// Sets up the Express app to handle data parsing
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Static directory
app.use(express.static("public"));

var exphbs = require("express-handlebars");
app.engine("handlebars", exphbs({
  defaultLayout: "main"
}));
app.set("view engine", "handlebars");

// Routes
// =============================================================
require("./routes/htmlRoutes.js")(app);
require("./routes/apiRoutes.js")(app);
// require('./controllers')(app);

// Syncing our sequelize models and then starting our Express app
// =============================================================
db.sequelize.sync().then(function() {
  app.listen(PORT, function() {
    console.log("App listening on PORT " + PORT);
  });
});

var server = require('http').Server(app);
var io = require('socket.io')(server);

app.get('/', function (req, res) {
res.sendFile(__dirname + '/index.html');
});
// let app = express();
// let server = http.server(app);
// let io = socketIO(server);

// server.listen(port, ()=>{
//   console.log("Server is up on port ${port}");
// })

io.on('connection', function(socket){
  socket.emit('news', { hello: 'world'});
  socket.on('my other event', function (data) {
    console.log('a user connected');  
  });
});



