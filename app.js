var connections = [];
var express = require('express');
var bodyParser = require('body-parser')
var expressValidator = require('express-validator');
var hbs = require('hbs'); //handlebars
var session = require('express-session');
var cookieParser = require('cookie-parser');
var fs = require('fs');
var routes = require('./routes/index');

var app = express();

var server = require('http').createServer(app);
var io = require('socket.io').listen(server);

app.set('views', (__dirname, 'views'));
app.set('view engine', '.hbs');

hbs.registerHelper('json', function(obj){
	return new hbs.SafeString(JSON.stringify(obj));
})

//Partials 
const partialsDir = __dirname + '/views/partials';

const filenames = fs.readdirSync(partialsDir);

filenames.forEach(function (filename) {
  const matches = /^([^.]+).hbs$/.exec(filename);
  if (!matches) {
    return;
  }
  const name = matches[1];
  const template = fs.readFileSync(partialsDir + '/' + filename, 'utf8');
  hbs.registerPartial(name, template);
});
//Partials

var serverPort = 3030;
server.listen(process.env.PORT || serverPort);
console.log("Połączono z serwerem na porcie: " + serverPort);

//app.use(express.static(__dirname + '/JavaScript'));
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(expressValidator());
app.use(cookieParser());
app.use(session({
    key: 'user_sid',
    secret: 'fsdfdsfsdfsdfsdfsdf',
    resave: false,
    saveUninitialized: false,
    cookie: {
        expires: 600000
    }
}));

app.use('/', routes);

// catch 404
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

//------------------------------------------------------------------------------------------------------------

io.sockets.on('connection', function(socket){
	connections.push(socket.id);
	console.log('Połączenie: socket %s został podłączony', socket.id);

	socket.on('disconnect', function(data){
		connections.splice(connections.indexOf(socket), 1);
		console.log('Połączenie: socket %s został odłączony', socket.id);
	});
	socket.on('ask', function(message) {
		console.log('otrzymalem zapytanie: %s od %d',message.offer, message.user);
		io.sockets.emit('ask', message);
	});
	socket.on('candidate_transmision', function(message) {
		console.log('otrzymalem stream: %s od %d',message.candidate, message.user);
		io.sockets.emit('candidate_transmision', message);
	});
	socket.on('candidate_reciever', function(message) {
		console.log('otrzymalem transmisje: %s od %d',message.candidate, message.user);
		io.sockets.emit('candidate_reciever', message);
	});
	socket.on('response', function(message) {
		console.log('otrzymalem odpowiedz: %s od %d',message.bobDesc, message.user);
		io.sockets.emit('response', message);
		
	});

});