var socket = io.connect();
var videosConn = {};
var isAttached = {"remoteVideo1": false,"remoteVideo2": false,"remoteVideo3": false,"remoteVideo4": false};
var peerConnections = {};
var dataChannels = {};
var TempDescriptions = {};
var TempIceCandidates = [];
var connection = {};
var ownSocket = null;
var socketSwitch = true;
var currTransmiterSocket = null;
var dc = null;
//var canConnect = true;
var getStreamDelay = 0;

var video1 = document.getElementById('remoteVideo1');
var video2 = document.getElementById('remoteVideo2');
var video3 = document.getElementById('remoteVideo3');
var video4 = document.getElementById('remoteVideo4');

var canvas = document.getElementById('snapShotCanvas');

var video1attached = false;
var video2attached = false;
var video3attached = false;
var video4attached = false;

var cam1btn = document.getElementById('cam1btn');
var cam2btn = document.getElementById('cam2btn');
var cam3btn = document.getElementById('cam3btn');
var cam4btn = document.getElementById('cam4btn');

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


var id = 0;
var loggedUserID = document.getElementById("user").innerHTML;

const dataChannelOptions = {
  ordered: false,
  maxPacketLifeTime: 3000,
};

var ID = function () {
  //return '_' + Math.random().toString(36).substr(2, 9);
  id++;
  return id;
};


function getKeyByValue(object, value) {
  return Object.keys(object).find(key => object[key] === value);
}

function getBrowserRTCConnectionObj () {
var servers = {'iceServers': [
    {url:'stun:stun1.l.google.com:19302'},
    {
        url: 'turn:turn.anyfirewall.com:443?transport=tcp',
        credential: 'webrtc',
        username: 'webrtc'
}]};

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


function btnCheck(){
	if (isAttached["remoteVideo1"] === false){
		$('#cam1btn').prop('disabled', true);
	} else {
		$('#cam1btn').prop('disabled', false);
	}
	if (isAttached["remoteVideo2"] === false){
		$('#cam2btn').prop('disabled', true);
	} else {
		$('#cam2btn').prop('disabled', false);
	}
	if (isAttached["remoteVideo3"] === false){
		$('#cam3btn').prop('disabled', true);
	} else {
		$('#cam3btn').prop('disabled', false);
	}
	if (isAttached["remoteVideo4"] === false){
		$('#cam4btn').prop('disabled', true);
	} else {
		$('#cam4btn').prop('disabled', false);
	}
}


function showVideo(videoNumber){

	switch(videoNumber){
		case 1:
			$("#video1div").css('display', "")
			$("#video2div").css('display', "None")
			$("#video3div").css('display', "None")
			$("#video4div").css('display', "None")
			break;
		case 2:
			$("#video1div").css('display', "None")
			$("#video2div").css('display', "")
			$("#video3div").css('display', "None")
			$("#video4div").css('display', "None")
			break;
		case 3:
			$("#video1div").css('display', "None")
			$("#video2div").css('display', "None")
			$("#video3div").css('display', "")
			$("#video4div").css('display', "None")
			break;
		case 4:
			$("#video1div").css('display', "None")
			$("#video2div").css('display', "None")
			$("#video3div").css('display', "None")
			$("#video4div").css('display', "")
			break;
		case 'all':
			$("#video1div").css('display', "")
			$("#video2div").css('display', "")
			$("#video3div").css('display', "")
			$("#video4div").css('display', "")
			break;
	}
}	

function getPeerConnection(){
	var pc = getBrowserRTCConnectionObj();
	id = ID();
	peerConnections[id] = pc;

	pc.onicecandidate = async function(evt){
		if (evt.candidate) {
			socket.emit('candidate_reciever', { "candidate": evt.candidate,
												"user": loggedUserID,
												"fromSocket": ownSocket,
												"toSocket": currTransmiterSocket });
			//tutaj połączenie staje się wolne.		
		}
	}, function(error){
			console.log(error)
		};

	pc.onaddstream = async function(evt){
		console.log('onaddstream triggered');

		if (video1){
			if (video1.readyState === 0){
				video1.srcObject = evt.stream;
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video1;
				isAttached["remoteVideo1"] = true;
			}
		}
		if (video2){
			if (video2.readyState === 0 && video1.readyState === 4){
				video2.srcObject = evt.stream
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video2;
				isAttached["remoteVideo2"] = true;
			}
		}
		if (video3){
			if (video3.readyState === 0 && video2.readyState === 4){
				video3.srcObject = evt.stream
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video3;
				isAttached["remoteVideo3"] = true;
			}
		}
		if (video4){
			if (video4.readyState === 0 && video3.readyState === 4){
				video4.srcObject = evt.stream			
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId] = video4;
				isAttached["remoteVideo4"] = true;
			}
		}
		btnCheck();
	};
	pc.oniceconnectionstatechange = async function(evt){
		try{	
			if (pc.iceConnectionState === 'connected'){
				socket.emit('free', {"state": "free",
									 "user": loggedUserID})
				//canConnect = true;	
			}
			if (pc.iceConnectionState === "disconnected") { 
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId].srcObject = null;
				isAttached[videosConn[connectionId].id] = false;
				delete videosConn[connectionId];
				delete peerConnections[connectionId];
				btnCheck();
	    	}
    	} catch(err) {
    		console.log(err)
    	}
	}
	
	return peerConnections[id];
}

function checkSignalingState(except_connection){
	var connId = getKeyByValue(peerConnections, except_connection)
	delete peerConnections[connId]
	//console.log(peerConnections)
	for(var key in peerConnections){
		//console.log(peerConnections[key])
		//console.log(peerConnections[key], peerConnections[key].signalingState)
		if (peerConnections[key].signalingState !== 'stable'){
			peerConnections[connId] = except_connection;
			return false;
		}
		
	}
	peerConnections[connId] = except_connection;
	//console.log(peerConnections)
	return true;
}

async function gotDescription(sdp) {
	console.log('sdp in gotDescription',sdp);
	await connection.setLocalDescription(sdp,
	function() {
	//tutaj połączenie staje się zajęte.
	registerIceCandidate();
	socket.emit('response', {"sdp": sdp,
							 "user": loggedUserID,
							 "fromSocket": ownSocket,
							 "toSocket": currTransmiterSocket});
	 }, function(error){
			console.log(error)
		});
	//console.log(connection.signalingState)
}

function registerIceCandidate() {
	try{
		for(var i = 0; i < TempIceCandidates.length; i++) {
		connection.addIceCandidate(
			new RTCIceCandidate(TempIceCandidates[i]), function() {
		}, function(error){
			console.log(error)
		});
		}
	} catch(err){
		console.log(err);
	}
}

function getStream(sdp){
	//pytanie: nowy objekt zawsze przyjmuje nazwe connection

		console.log(time, 'getStream()');
		connection = getPeerConnection();
		console.log(connection);
		//connection.oniceconnectionstatechange = removeEmptyStream;
		connection.setRemoteDescription(new RTCSessionDescription(sdp),
		function() {
			connection.createAnswer().then(gotDescription);
				//toggleVideo();
		}, function(error){
			console.log(error)
		});
		

};



socket.on('candidate_transmision', function(candidate){
	if (candidate.user === loggedUserID && candidate.socket === currTransmiterSocket){
		TempIceCandidates.push(candidate.candidate);	
	}
	
});

socket.on('ask', function(offer){
if (offer.user === loggedUserID){
	socket.emit('busy', {"state": "busy",
						 "user": loggedUserID})
	//TempDescriptions = JSON.parse();
	//console.log(offer.sdp)
	currTransmiterSocket = offer.fromSocket;
	console.log('sdp in ask',JSON.parse(offer.sdp));
	getStream(JSON.parse(offer.sdp));
}
});

socket.on('socket', function(msg){
  if (socketSwitch === true){
    ownSocket = msg;
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