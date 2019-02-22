var connections = [];
var express = require('express');
var bodyParser = require('body-parser')
var expressValidator = require('express-validator');
var hbs = require('hbs'); //handlebars
var session = require('express-session');
var cookieParser = require('cookie-parser');
var fs = require('fs');
var routes = require('./routes/router');
var https = require('https');
var path = require('path');
var mysql = require('mysql');

var databasePort = 3306;
var dataBaseName = 'BazaDanych';
const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	port: databasePort,
	database: dataBaseName
});

setTimeout(function(){connectToDB()},1000);

function connectToDB(){
	db.connect((err) =>{
		if(err){
			console.log(err);
		} else {
			console.log('Połączono z bazą danych na porcie: ' + databasePort)		
		}

	});
};

var app = express();

const httpsOptions = {
	cert: fs.readFileSync(path.join(__dirname, 'ssl', 'server.crt')),
	key: fs.readFileSync(path.join(__dirname, 'ssl', 'server.key'))
};
var server = https.createServer(httpsOptions, app);
var io = require('socket.io', { rememberTransport: false, transports: ['WebSocket', 'Flash Socket', 'AJAX long-polling'] }).listen(server);

app.set('views', (__dirname, 'views'));
app.set('view engine', '.hbs');

hbs.registerHelper('json', function(obj){
	objString = JSON.stringify(obj);
	return JSON.parse(objString);
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
server.listen(serverPort, function(){
		console.log("Połączono z serwerem na porcie: " + serverPort);
	})
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

function getTime(){
	var currentdate = new Date();
	var ss = currentdate.getSeconds();
	if (ss < 10){
		ss = '0' + ss;
	};
	var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + ss;
	return time;
};

function getDate(){
	var currentdate = new Date();
	var dd = currentdate.getDate();
	var mm = currentdate.getMonth() +1;
	var yyyy = currentdate.getFullYear();
	if (dd < 10){
		dd = '0' + dd;
	};
	if (mm < 10){
		mm = '0' + mm;
	};
	var date = dd+'.'+
					mm+'.'+
					yyyy;
	return date;
};

function logToDatabase(login, event){
	let sql = "INSERT INTO Logs(login, event, date, time) VALUES(\""+login+"\", \""+event+"\",\""+getDate()+"\", \""+getTime()+"\")";
	let query = db.query(sql, (err, result) =>{
		if(err){
			throw err;
		};
	});
};

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
	});
	socket.on('unload', function(message){
		socket.broadcast.emit('unload',message);
	});
	socket.on('offerLog', function(message){
		logToDatabase(message.user, 'Sent offer');
	});
	socket.on('answerLog', function(message){
		logToDatabase(message.user, 'Sent answer');
	});
	socket.on('photoLog', function(message){
		logToDatabase(message.user, 'Photo taken');
	});
	socket.on('fdStartLog', function(message){
		logToDatabase(message.user, 'Face Detecting started');
	});
	socket.on('fdStopLog', function(message){
		logToDatabase(message.user, 'Face Detecting stopped');
	});
});

// ZROBIĆ TO SAMO CO PRZY RESTARCIE ICE Z CANRESTART TYLKO PRZY NORMALNYM ŁĄCZENIU KILKU KAMER