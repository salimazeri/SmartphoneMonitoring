var connections = [];
var express = require('express');
var bodyParser = require('body-parser')
var expressValidator = require('express-validator');
var hbs = require('hbs'); //handlebars
var session = require('express-session');
var cookieParser = require('cookie-parser');
var fs = require('fs');
var routes = require('./routes/index');
var https = require('https')
var path = require('path');

var app = express();

//var server = require('http').createServer(app);
const httpsOptions = {
	cert: fs.readFileSync(path.join(__dirname, 'ssl', 'server.crt')),
	key: fs.readFileSync(path.join(__dirname, 'ssl', 'server.key'))
};
var server = https.createServer(httpsOptions, app)
var io = require('socket.io', { rememberTransport: false, transports: ['WebSocket', 'Flash Socket', 'AJAX long-polling'] }).listen(server);

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
//server.listen(process.env.PORT || serverPort);
server.listen(serverPort, function(){
		console.log("Połączono z serwerem na porcie: " + serverPort);
	})
//console.log("Połączono z serwerem na porcie: " + serverPort);

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


//------------------------------------------------------------------------------------------------------------

io.sockets.on('connection', function(socket){
	connections.push(socket.id);
	console.log('Połączenie: socket %s został podłączony', socket.id);
	socket.emit('socket', socket.id);

	socket.on('disconnect', function(data){
		connections.splice(connections.indexOf(socket), 1);
		console.log('Połączenie: socket %s został odłączony', socket.id);
	});
	socket.on('ask', function(message) {
		socket.broadcast.emit('ask', message);
		console.log('------------ ASK ------------')
	});
	socket.on('candidate_transmision', function(message) {
		socket.broadcast.emit('candidate_transmision', message);
		console.log('ct:',message.candidate.candidate);
	});
	socket.on('candidate_reciever', function(message) {
		socket.to(message.toSocket).emit('candidate_reciever', message);
		console.log('cr:',message.candidate.candidate);
	});
	socket.on('response', function(message) {
		socket.to(message.toSocket).emit('response', message);
		console.log('------------ RESPONSE ------------')
	});
	socket.on('busy', function(message){
		socket.broadcast.emit('busy', message);
	});
	socket.on('free', function(message){
		socket.broadcast.emit('free', message);
	});
	socket.on('load', function(message){
		socket.broadcast.emit('load', message);
	})
	socket.on('unload', function(message){
		socket.broadcast.emit('unload',message);
	})
});

// ZROBIĆ TO SAMO CO PRZY RESTARCIE ICE Z CANRESTART TYLKO PRZY NORMALNYM ŁĄCZENIU KILKU KAMER