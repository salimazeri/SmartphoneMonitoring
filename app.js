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

hbs.registerHelper('ifequal',function(a, b,options)
{
    if (a==b){
    	return options.fn(this);
    } else {
    	return options.inverse(this);
    }
});

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
    saveUninitialized: false
}));

app.use('/', routes);

// catch 404


//------------------------------------------------------------------------------------------------------------

io.sockets.on('connection', function(socket){
	connections.push(socket.id);
	console.log('Połączenie: socket %s został podłączony', socket.id);
	io.sockets.emit('socket', socket.id);

	socket.on('disconnect', function(data){
		connections.splice(connections.indexOf(socket), 1);
		console.log('Połączenie: socket %s został odłączony', socket.id);
	});
	socket.on('ask', function(message) {
		io.sockets.emit('ask', message);
		console.log('ask:',message)
	});
	socket.on('candidate_transmision', function(message) {
		io.sockets.emit('candidate_transmision', message);
		console.log('candidate_transmision:',message)
	});
	socket.on('candidate_reciever', function(message) {
		io.sockets.to(message.toSocket).emit('candidate_reciever', message);
		console.log('candidate_reciever:',message)
	});
	socket.on('response', function(message) {
		io.sockets.to(message.toSocket).emit('response', message);
		console.log('response:',message)
	});

	socket.on('init', function(message){
		console.log('init');
		io.sockets.emit('init', message);
	});

});