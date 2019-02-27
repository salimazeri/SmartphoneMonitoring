var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var path = require('path');
var nodemailer = require('nodemailer');
var bcrypt = require('bcrypt');
const saltRounds = 10;

let transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    secure: false,
    requireTLS: true,
    auth: {
        user: '19salimazeri96@gmail.com',
        pass: 'haslohaslo1'
    }
});

var databasePort = 3306;
var dataBaseName = 'BazaDanych';
var userTableName = 'Users';

function sendMail(to_, subject_, text_, callback){
	let isSend = null;
	var mailOptions = {
	  from: '19salimazeri96@gmail.com',
	  to: to_,
	  subject: subject_,
	  text: text_
	};

	transporter.sendMail(mailOptions, function(error, info){
	  if (error) {
	    console.log(error);
	    callback(false);
	  } else {
	    console.log('Email sent: ' + info.response);
	    callback(true);
	  }
	});
}

function getTime(){
	var currentdate = new Date();
	var ss = currentdate.getSeconds();
	var mm = currentdate.getMinutes();
	if (ss < 10){
		ss = '0' + ss;
	};
	if (mm < 10){
		mm = '0' + mm;
	}
	var time = currentdate.getHours() + ":" + mm + ":" + ss;
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
	var sql = "CREATE TABLE IF NOT EXISTS Users (id INT(11) NOT NULL AUTO_INCREMENT,email VARCHAR(255) NOT NULL, login VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY (id))";
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



// This middleware will check if user's cookie is still saved in browser and user is not set, then automatically log the user out.
// This usually happens when you stop your express server after login, your cookie still remains saved in the browser.
router.use((req, res, next) => {
    res.set('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
    next();
});

// middleware function to check for logged-in users
var sessionChecker = (req, res, next) => {
    if (req.session.user && req.cookies.user_sid) {
    	if (req.session.user === 'admin'){
    		res.render('admin', {user: req.session.user});
    	} else {
        	res.render('index', {user: req.session.user});
        }
    } else {
    	console.log('nie zalogowany');
        next();
    }    
};

router.get('/favicon.ico', (req,res) =>{
	res.sendStatus(200);
	res.send();
	return;
});

router.get('/', sessionChecker, (req, res) => {
        res.redirect('/logowanie');
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
		const email = req.body.email
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
						let sql = "INSERT INTO Users(login,email, password) VALUES(\""+login+"\", \""+email+"\", \""+hash+"\")";
						let query = db.query(sql, (err, result) => {
							if(err){
								throw err;
							};
							logToDatabase(login, 'Registration successfuly');
							//session user = login
							//req.session.user = login;
							let info = 'Registration was successful';
							sendMail(email, 'Successful registration', 'Dear '+ login +',Your registration on the SmartphoneMonitoring website has been successful.')
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
		const password = req.body.password;
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
					let error = "User doesnt exist";
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

router.route('/manageprofile')
	.get( (req,res) =>{
		if (req.session.user && req.cookies.user_sid) {
			res.render('manageprofile', {user: req.session.user});
		} else {
			res.redirect('/')
		}	
	})

router.route('/deleteprofile')
	.get( (req, res) =>{
		if (req.session.user && req.cookies.user_sid) {
			res.render('deleteprofile', {user: req.session.user});
		} else {
			res.redirect('/')
		}	
	})
	.post( (req,res) =>{
		let canDelete = req.body.canDelete;
		if (canDelete === 'yes'){
			db.query('DELETE from Users WHERE login = \"'+req.session.user+'\"', function(err, result){
				if(err){
					console.log('error', err);
				} else {
					res.render('deleteprofile', {user: req.session.user,
    							 	          info: 'Profile has been deleted, you have been logged out'});
					delete req.session.user;
					delete req.cookies.user_sid;
				}
			})
		} else {
			res.render('deleteprofile', {user: req.session.user,
    							 	  info: 'Profile has not been deleted'});	
		}
		
	});


router.route('/changepassword')
	.get( (req,res) =>{
		if (req.session.user && req.cookies.user_sid) {
			res.render('changepassword', {user: req.session.user});
		} else {
			res.redirect('/')
		}	
	})
	.post( (req, res) =>{
		const old_password = req.body.old_password;
		const new_password = req.body.new_password;
		req.checkBody('old_password', 'Old password can\'t be empty').notEmpty();
		req.checkBody('new_password', 'New password can\'t be empty').notEmpty();
		req.checkBody('new_password', 'New password should contain between 8 and 50 characters').len(8,50);
		req.checkBody('new_password_retype', 'Repeat new password').notEmpty();
		req.checkBody('new_password_retype', 'Passwords do not match').equals(req.body.new_password);

		const password_change_errors = req.validationErrors();
		//błąd przy wpisywaniu danych do rejestracji
		if (password_change_errors) {
			//Wyświetlanie błędów na stronie rejestracji 
			res.render('changepassword', {user: req.session.user,
										  errors: password_change_errors});
		} else {
			let login_sql = "SELECT password FROM Users WHERE login = \""+req.session.user+"\"";
			console.log(login_sql);
			let login_query = db.query(login_sql,(err, result) => {
				if(err){
					throw err;
				}
				let hash = result[0].password;
				bcrypt.compare(old_password, hash, function(err,result){
					
					if (result === true){
						bcrypt.hash(new_password, saltRounds, function(err, hash) {
							console.log(new_password, hash);
							let sql = 'UPDATE Users SET password = \"'+hash+'\" WHERE login = \"'+req.session.user+'\"';
							let query = db.query(sql, (err, result) => {
								if(err){
									throw err;
								};
								res.render('changepassword', {user: req.session.user,
													          info: 'Password has been changed successfully, you have been logged out'});
								logToDatabase(req.session.user, 'Password changed');
								delete req.session.user;
								delete req.cookies.user_sid;
								
							})
						});

					} else {
						console.log('hereeeeeee');
						res.render('changepassword', {user: req.session.user,
													  error: 'Old password you provided is incorrect'});
					}
				})					
			})		
		}
	});
	

router.get('/checklogs', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
		db.query('SELECT * FROM Logs', function(err, rows){
			if (err){
				console.log('error:', err);
			} else {
				console.log(rows[0])
				res.render('checklogs', {user: req.session.user,
    							 		 Logs: rows});	
			}
		})
    	
    } else {
    	res.redirect('/');
    }
})

router.get('/userlogs:User', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
		db.query('SELECT * FROM Logs WHERE login = \''+req.params.User+'\';', function(err, rows){
			if (err){
				console.log('error:', err);
			} else {
				console.log(rows[0])
				if (rows.length === 0){
					res.render('checklogs', {user: req.session.user,
    							 		     error: "There are no logs for this user"});
				} else {
					res.render('checklogs', {user: req.session.user,
    							 		     Logs: rows});
				}	
			}
		})
    	
    } else {
    	res.redirect('/');
    }
})

router.get('/manageusers', function(req, res){
	if (req.session.user && req.cookies.user_sid) {
		db.query("SELECT login FROM Users WHERE login NOT LIKE 'admin'", function(err, rows){
			if (err){
				console.log('error:', err);
			} else {
				console.log(rows[0])
				var rows = rows;
				res.render('manageusers', {user: req.session.user,
    							 		   Users: rows});	
			}
		})
    	
    } else {
    	res.redirect('/');
    }
})

router.route('/deleteUser:User')
	.get( (req, res) =>{
		if (req.session.user && req.cookies.user_sid) {
			res.render('deleteuser', {user: req.session.user,
									  deleting_user: req.params.User})
	    } else {
	    	res.redirect('/');
	    }
	})
	.post( (req,res) =>{
		let canDelete = req.body.canDelete;
		if (canDelete === 'yes'){
			db.query('DELETE from Users WHERE login = \"'+req.params.User+'\"', function(err, result){
				if(err){
					console.log('error', err);
				} else {
					res.render('deleteuser', {user: req.session.user,
    							 	          info: 'User has been deleted'});
				}
			})
		} else {
			res.render('deleteuser', {user: req.session.user,
    							 	  info: 'User has not been deleted'});	
		}
		
	});


router.route('/sendMailto:User')
	.get( (req,res) =>{
		if (req.session.user && req.cookies.user_sid) {	
			res.render('mailsender', {user: req.session.user});
	    } else {
	    	res.redirect('/');
	    }
	})
	.post( (req,res) =>{
		let subject = req.body.subject;
		let mailText = req.body.mailText;
		db.query("SELECT email FROM Users WHERE login = \""+req.params.User+"\"", function(err, result){
			if (err){
				console.log('error:', err);
			} else {
				let email = result[0].email
				sendMail(email, subject, mailText, function(isSend){
					if (isSend === true){
						res.render('mailsender', {user: req.session.user,
												  info: 'Message was sent successfully'});
					} else {
						res.render('mailsender', {user: req.session.user,
												  info: 'Message has not been sent'});
					}
				});
			}
		
	});
});

module.exports = router;

