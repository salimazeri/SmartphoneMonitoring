var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var path = require('path');

var databasePort = 3306;
var dataBaseName = 'BazaDanych';
var userTableName = 'Users';

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

const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	port: databasePort,
	database: dataBaseName
});

const db_init = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	port: databasePort
});

createDataBase();
createUserTable();
createLogTable();
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
		
function createDataBase(){
	var sql = "CREATE DATABASE IF NOT EXISTS BazaDanych";
	db_init.query(sql, function (err, result) {
    	if (err) throw err;
  	});
};

function createUserTable(){
	var sql = "USE BazaDanych";
	db_init.query(sql, function (err, result) {
    	if (err) throw err;
  	});
	var sql = "CREATE TABLE IF NOT EXISTS Users (id INT(11) NOT NULL AUTO_INCREMENT, login VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY (id))";
	db_init.query(sql, function (err, result) {
    	if (err) throw err;
  	});
};

function createLogTable(){
	var sql = "USE BazaDanych";
	db_init.query(sql, function (err, result) {
    	if (err) throw err;
  	});
	var sql = "CREATE TABLE IF NOT EXISTS Logs (id INT(11) NOT NULL AUTO_INCREMENT, login VARCHAR(255) NOT NULL, event VARCHAR(255) NOT NULL, date VARCHAR(255) NOT NULL, time VARCHAR(255) NOT NULL, PRIMARY KEY (id))";
	db_init.query(sql, function (err, result) {
    	if (err) throw err;
  	});
};

function logToDatabase(login, event){
	let sql = "INSERT INTO Logs(login, event, date, time) VALUES(\""+login+"\", \""+event+"\",\""+getDate()+"\", \""+getTime()+"\")";
	let query = db.query(sql, (err, result) =>{
		if(err){
			throw err;
		};
	});
};

var bcrypt = require('bcrypt');
const saltRounds = 10;

// This middleware will check if user's cookie is still saved in browser and user is not set, then automatically log the user out.
// This usually happens when you stop your express server after login, your cookie still remains saved in the browser.
router.use((req, res, next) => {
    res.set('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
    next();
});

// middleware function to check for logged-in users
var sessionChecker = (req, res, next) => {
    if (req.session.user && req.cookies.user_sid) {
        res.render('index', {
        	user: req.session.user
        });
    } else {
        next();
    }    
};

router.get('/favicon.ico', (req,res) =>{
	res.sendStatus(200);
	res.send();
	return;
});

router.get('/', sessionChecker, (req, res) => {	
	if (req.session.user && req.cookies.user_sid) {
		//res.cookie('user_sid');
        res.render('index', {user: req.session.user});
    } else {
        res.redirect('/logowanie');
    }
});

router.get('/wylogowanie', (req, res) => {
    if(req.session){
    	logToDatabase(req.session.user, 'Logout successfuly');
    	res.clearCookie('user_sid');
    	req.session.destroy(function(){});
    }
    res.redirect('/');
    
});

router.route('/rejestracja')
	.get(sessionChecker, (req,res) =>{
		res.render('rejestracja', { title: 'Sign up'});
	})
	.post( (req,res) =>{
		const login = req.body.login;
		const password = req.body.password
		req.checkBody('login', 'Login can\'t be empty').notEmpty();
		req.checkBody('login', 'Login should contain between 5 and 20 characters').len(5,20);
		req.checkBody('password', 'Password can\'t be empty').notEmpty();
		req.checkBody('password', 'Password should contain between 8 and 50 characters').len(8,50);
		req.checkBody('reEnteredPassword', 'Repeat password').notEmpty();
		req.checkBody('reEnteredPassword', 'Passwords do not match').equals(req.body.password);

		const sign_up_errors = req.validationErrors();
		//błąd przy wpisywaniu danych do rejestracji
		if (sign_up_errors) {
			//Wyświetlanie błędów na stronie rejestracji 
			res.render('rejestracja', {
				title: 'Sign up error',
				errors: sign_up_errors
			});
		} else {
			let sql = "SELECT * FROM Users WHERE login = \""+login+"\"";
			let query = db.query(sql, (err, result) => {
				if(err){
					throw err;
				}
				if (result.length){
					//Użytkownik o podanym loginie już istnieje
					let error = 'User with the given login already exists.'
					logToDatabase(login, 'Registration unsuccessfuly');
					res.render('rejestracja', {
						title: 'Sign up error',
						error: error
					});
				} else {
					//Rejestracja pomyślna
					bcrypt.hash(password, saltRounds, function(err, hash) {
						let sql = "INSERT INTO Users(login, password) VALUES(\""+login+"\", \""+hash+"\")";
						let query = db.query(sql, (err, result) => {
							if(err){
								throw err;
							};
							logToDatabase(login, 'Registration successfuly');
							//session user = login
							//req.session.user = login;
							let info = 'Registration was successful';
							res.render('logowanie', {
								title: 'Sign in',
								info: info});
						})
					});
				}
			})
		}
	})

router.route('/logowanie')
	.get(sessionChecker, (req, res) => {
		res.render('logowanie', { title: "Sign in"});
	})
	.post( (req,res) => {
		const login = req.body.login;
		const password = req.body.password
		req.checkBody('login', 'Login can\'t be empty').notEmpty();
		req.checkBody('password', 'Password can\'t be empty').notEmpty();

		const sign_in_errors = req.validationErrors();
		//Jeżeli login lub hasło przy logowaniu są puste
		if (sign_in_errors) {
			res.render('logowanie', {
				title: 'Sign in error',
				errors: sign_in_errors
			});
		} else {
			let login_sql = "SELECT password FROM Users WHERE login = \""+login+"\"";
			console.log(login_sql);
			let login_query = db.query(login_sql,(err, result) => {
				if(err){
					throw err;
				}
				if (!result.length){
					let error = 'Uźytkownik nie istnieje'
					logToDatabase(login, "Login unsuccessfuly- User doesn't exist");
					res.render('logowanie', {
						title: 'Sign in error',
						error: error
					})
				} else {
					let hash = result[0].password;
					bcrypt.compare(password, hash, function(err,result){
						if (result === true){
							req.session.user = login;
							logToDatabase(login, "Login successfuly");
							res.redirect('/');

						} else {
							let error = 'Incorrect data'
							logToDatabase(login, "Login unsuccessfuly- Incorrect data");
							res.render('logowanie', {
								title: 'Sign in error',
								error: error
							})
						}
					})					
				}
			})	
		}
	})

router.get('/wysylanie', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('wysylanie', {user: req.session.user});
    } else {
    	res.redirect('/');
    }
});
router.get('/odbieranie', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user});
    } else {
    	res.redirect('/');
    }
});

router.get('/cam1', function(req, res){
	console.log('rendering cam 1');
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user,
							  	  cam: 'cam1'});
    } else {
    	res.redirect('/');
    }
	
});

router.get('/cam2', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user,
							  	  cam: 'cam2'});
    } else {
    	res.redirect('/');
    }
});

router.get('/cam3', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user,
							  	  cam: 'cam3'});
    } else {
    	res.redirect('/');
    }
});

router.get('/cam4', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user,
							  	  cam: 'cam4'});
    } else {
    	res.redirect('/');
    }
});

router.get('/all_cams', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
    	res.render('odbieranie', {user: req.session.user,
							  	  cam: 'all_cams'});
    } else {
    	res.redirect('/');
    }
});

module.exports = router;

