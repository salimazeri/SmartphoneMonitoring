var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var path = require('path');

var databasePort = 3306;
var dataBaseName = 'BazaDanych';

const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	port: databasePort,
	database: dataBaseName
});

db.connect((err) =>{
	if(err){
		throw err;
	}
	console.log('Połączono z bazą danych na porcie: ' + databasePort)
});

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
    	console.log('Użytkownik jest zalogowany, gdy chce wejść na stronę logowania/rejestracji powinien zostać wyrzucony do dashboarda');
        res.render('index', {
        	user: req.session.user
        });
    } else {
    	console.log('Użytkownik nie jest zalogowany, bez problemu powinien wejść na stronę logowania/rejestracji');
        next();
    }    
};

router.get('/', sessionChecker, (req, res) => {
	console.log(req.session.user, req.cookies.user_sid);
	if (req.session.user && req.cookies.user_sid) {
		//res.cookie('user_sid');
        res.render('index', {user: req.session.user});
    } else {
        res.redirect('/logowanie');
    }
});

router.get('/wylogowanie', (req, res) => {
    if(req.session){
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
			console.log('errors: ',JSON.stringify(sign_up_errors));
			//Wyświetlanie błędów na stronie rejestracji 
			res.render('rejestracja', {
				title: 'Sign up error',
				errors: sign_up_errors
			});
		} else {
			let sql = "SELECT * FROM Users WHERE login = \""+login+"\"";
			console.log(sql);
			let query = db.query(sql, (err, result) => {
				if(err){
					throw err;
				}
				if (result.length){
					//Użytkownik o podanym loginie już istnieje
					console.log("Użytkownik nie może zostać zarejestrowany poniewaz użytkownik z podanym loginem już istnieje");
					let error = 'Użytkownik o podanym loginie już istnieje'
					res.render('rejestracja', {
						title: 'Sign up error',
						error: error
					});
				} else {
					//Rejestracja pomyślna
					console.log("Użytkownik może zostać zarejestrowany");
					bcrypt.hash(password, saltRounds, function(err, hash) {
						let sql = "INSERT INTO Users(login, password) VALUES(\""+login+"\", \""+hash+"\")";
						console.log(sql);
						let query = db.query(sql, (err, result) => {
							if(err){
								throw err;
							}
							console.log("Użytkownik został zarejestrowany");
							//session user = login
							req.session.user = login;
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
			console.log('errors: ',JSON.stringify(sign_in_errors));
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
					console.log('here');
					let error = 'Uźytkownik nie istnieje'
						res.render('logowanie', {
							title: 'Sign in error',
							error: error
						})
				} else {
					let hash = result[0].password;
					bcrypt.compare(password, hash, function(err,result){
						if (result === true){
							console.log('haslo prawidlowe');
							console.log("Użytkownik zalogowany pomyślnie");
							req.session.user = login;
							res.redirect('/');

						} else {
							console.log('haslo nieprawidłowe');
							console.log("Dane nieprawidłowe");
							let error = 'Incorrect data'
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
	console.log(req.session.user, req.cookies.user_sid)
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

module.exports = router;

