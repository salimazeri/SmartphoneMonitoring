//TODO: zdarzenie gdy strona wysylajaca sie wywala( zmiana video na obrazek, potem zastapienie na video gdy nadejdzie nowy)
//	aktualnie robione, rozróżnianie obiejktów RTCPeerConnection
//DONE: StopFaceDetect
//TOOD: SetInterval na init() w odbieraniu
//TODO: SetInterval na sendStream jak dissconnected dopóki połączy
//TODO: Rozmiar video a rozmiar źródła obrazu
var videosConn = {};
var isAttached = {"remoteVideo1": false,"remoteVideo2": false,"remoteVideo3": false,"remoteVideo4": false};
var peerConnections = {};
var TempDescriptions = {};
var TempIceCandidates = [];
var connection = {};
var ownSocket = null;
var socketSwitch = true;
var currTransmiterSocket = null;
var socket = io.connect();

var video1 = document.getElementById('remoteVideo1');
var video2 = document.getElementById('remoteVideo2');
var video3 = document.getElementById('remoteVideo3');
var video4 = document.getElementById('remoteVideo4');

var canvas = document.getElementById('snapShotCanvas');

var video1attached = false;
var video2attached = false;
var video3attached = false;
var video4attached = false;

var faceDetectedAudio = document.getElementById("faceDetectedAudio"); 

var currentdate = new Date();
var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
var dd = currentdate.getDate();
var mm = currentdate.getMonth() +1;
var yyyy = currentdate.getFullYear();
var ss = currentdate.getSeconds();
if (ss < 10){
	ss = '0' + ss;
}
if (dd < 10){
	dd = '0' + dd;
}
if (mm < 10){
	mm = '0' + mm;
}
var date_time = dd+'.'+
				mm+'.'+
				yyyy+'_'+
				currentdate.getHours()+'-'+
				currentdate.getMinutes()+'-'+
				ss;

var id =0;

var loggedUserID = document.getElementById("user").innerHTML;

var ID = function () {
  //return '_' + Math.random().toString(36).substr(2, 9);
  id++;
  return id;
};

function getKeyByValue(object, value) {
  return Object.keys(object).find(key => object[key] === value);
}

function getBrowserRTCConnectionObj () {
	var servers = {'iceServers': [{'url': 'stun:stun.services.mozilla.com'}, {'url': 'stun:stun.l.google.com:19302'}]};
	
	if (window.mozRTCPeerConnection) {
		return new mozRTCPeerConnection(servers);
	} else if (window.webkitRTCPeerConnection) {
			return new webkitRTCPeerConnection(servers);
	} else if (window.msRTCPeerConnection) {
			return new msRTCPeerConnection(servers);
	} else {
		return new RTCPeerConnection(servers);
	}
}

function show1(){
	$("#video1div").css('display', "")
	$("remoteVideo1").css('width', "auto;", 'height', "auto;");
	$("#video2div").css('display', "None")
	$("#video3div").css('display', "None")
	$("#video4div").css('display', "None")
}

function show2(){
	$("#video1div").css('display', "None")
	$("#video2div").css('display', "")
	$("#video3div").css('display', "None")
	$("#video4div").css('display', "None")
}

function show3(){
	$("#video1div").css('display', "None")
	$("#video2div").css('display', "None")
	$("#video3div").css('display', "")
	$("#video4div").css('display', "None")
}

function show4(){
	$("#video1div").css('display', "None")
	$("#video2div").css('display', "None")
	$("#video3div").css('display', "None")
	$("#video4div").css('display', "")
}

function showAll(){
	$("#video1div").css('display', "")
	$("#video2div").css('display', "")
	$("#video3div").css('display', "")
	$("#video4div").css('display', "")
}

function getPeerConnection(){
	var pc = getBrowserRTCConnectionObj();
	id = ID();
	peerConnections[id] = pc;

	pc.onicecandidate = function(evt){
		if (evt.candidate) {
			socket.emit('candidate_reciever', { "candidate": evt.candidate,
												"user": loggedUserID,
												"fromSocket": ownSocket,
												"toSocket": currTransmiterSocket });
		}
	}, displayError;
	pc.onaddstream = function(evt){
		if (video1){
			if (video1.readyState === 0){
				attachMediaStream(video1, evt.stream);
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video1;
				isAttached["remoteVideo1"] = true;
			}
		}
		if (video2){
			console.log('2')
			if (video2.readyState === 0 && video1.readyState === 4){
				attachMediaStream(video2, evt.stream);
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video2;
				isAttached["remoteVideo2"] = true;
			}
		}
		if (video3){
			if (video3.readyState === 0 && video2.readyState === 4){
				attachMediaStream(video3, evt.stream);
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video3;
				isAttached["remoteVideo3"] = true;
			}
		}
		if (video4){
			if (video4.readyState === 0 && video3.readyState === 4){
				attachMediaStream(video4, evt.stream);
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video4;
				isAttached["remoteVideo4"] = true;
			}
		}
	};
	pc.oniceconnectionstatechange = function(evt){
		if (pc.iceConnectionState === "disconnected") { 
    			var connectionId = getKeyByValue(peerConnections,pc);
    			videosConn[connectionId].srcObject = null;
    			isAttached[videosConn[connectionId].id] = false;
    			delete videosConn[connectionId];
    			delete peerConnections[connectionId];
    	}
	}
	return pc;
}

function gotDescription(bobDesc) {
	connection.setLocalDescription(bobDesc,
	function() {
			registerIceCandidate();
			socket.emit('response', {"bobDesc": bobDesc,
									 "user": loggedUserID,
									 "fromSocket": ownSocket,
									 "toSocket": currTransmiterSocket});
	 }, displayError);
}

function registerIceCandidate() {
	for(var i = 0; i < TempIceCandidates.length; i++) {
		connection.addIceCandidate(
			new RTCIceCandidate(TempIceCandidates[i]), function() {
		}, displayError);
	}
}

function displayError(error) {
	console.error(error);
};

function getStream(){
	console.log('Trying to getStream()')
	//pytanie: nowy objekt zawsze przyjmuje nazwe connection
	try {
		connection = getPeerConnection();
		
		//connection.oniceconnectionstatechange = removeEmptyStream;
		connection.setRemoteDescription(
			new RTCSessionDescription(TempDescriptions),
			function() {
				connection.createAnswer(gotDescription, displayError);
				//toggleVideo();
		}, displayError);
	}

	catch(err){
		alert('There is no source, try to transmit stream.');
	}
};



socket.on('candidate_transmision', function(candidate){
	if (candidate.user === loggedUserID && candidate.socket === currTransmiterSocket){
		TempIceCandidates.push(candidate.candidate);	
	}
	
});

socket.on('ask', function(offer){
	if (offer.user === loggedUserID){
		TempDescriptions = JSON.parse(offer.offer);
		currTransmiterSocket = offer.socket;
	}
});

socket.on('init', function(msg){
	if (msg.user === loggedUserID){
		getStream();
	}
});

socket.on('socket', function(msg){
  if (socketSwitch === true){
    ownSocket = msg;
    console.log('Socket sesji:',ownSocket)
    socketSwitch = false;  
  }
 });

var stopInterval = false;

function startFaceDetect(){
	stopInterval = false;
	const facedetect = setInterval(function() {
		if(stopInterval === false){
			if (isAttached["remoteVideo1"] === true){
					faceDetect("remoteVideo1");
			}
			if (isAttached["remoteVideo2"] === true){
				faceDetect("remoteVideo2");
			}
			if (isAttached["remoteVideo3"] === true){
				faceDetect("remoteVideo3");
			}
			if (isAttached["remoteVideo4"] === true){
				faceDetect("remoteVideo4");
			}
		};	
	}, 500);
	console.log('Face detection started');
};

var canvas = document.querySelector('canvas');
	var ctx = canvas.getContext('2d');
	var w, h, ratio
if (video1){
	video1.addEventListener('loadedmetadata', function(){
		ratio = video1.videoWidth / video1.videoHeight;
		w = video1.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h
	}, false);
}
if (video2){
	video2.addEventListener('loadedmetadata', function(){
		ratio = video2.videoWidth / video2.videoHeight;
		w = video2.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h
	}, false);
}
if (video3){
	video3.addEventListener('loadedmetadata', function(){
		ratio = video3.videoWidth / video3.videoHeight;
		w = video3.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h
	}, false);
}
if (video4){
	video4.addEventListener('loadedmetadata', function(){
		ratio = video4.videoWidth / video4.videoHeight;
		w = video4.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h
	}, false);
}

function snapShot(video){
	if (isAttached[video.id] === false){
		alert(video.id+' is not attached.');
		return;
	}
	ctx.fillRect(0,0,w,h);
	ctx.drawImage(video,0,0,w,h);
	var dataURI = canvas.toDataURL('image/jpeg');
	var link = document.createElement('a');
	link.download = video.id +'-'+date_time;
	link.href = dataURI;
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
	delete link;
}
function stopFaceDetect(){
	stopInterval = true;
	$('.face').remove();
	console.log('Face detection stoped');};

function faceDetect(video){
	$('.face').remove();
    var coords = jQuery("#"+video).faceDetection({
	complete: function(faces) {
		for (var i = 0; i < faces.length; i++) {
			if(faces[i].confidence > -5){
				faceDetectedAudio.play();
        		console.log(time,',',video,': wykryto twarz ',i+1,', pewność: ',faces[i].confidence);
        		jQuery(video, {
                    'class':'face',
                    'css': {
                        'position': 'absolute',
                        'left':     faces[i].x-50 + 'px',
                        'top':      faces[i].y-50 + 'px',
                        'width':    faces[i].width  + 'px',
                        'height':   faces[i].height + 'px'
                    }
                })
                .insertAfter(this);
			};	                
		};
	},
	error: function() {
		console.warn("Could not process image");
	}
	});

};


//