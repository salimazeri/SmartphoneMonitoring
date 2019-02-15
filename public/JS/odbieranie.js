//"use strict";
/* global mozRTCIceCandidate, RTCIceCandidate, RTCSessionDescription, mozRTCSessionDescription */
var socket = io.connect();
var videosConn = {};
var peerConnections = {};
var TempDescriptions = {};
var connection = {};
var TempIceCandidates = [];
var connections = [];
var ownSocket = null;
var currTransmiterSocket = null;
var socketSwitch = true;
var isAttached = {"remoteVideo1": false,"remoteVideo2": false,"remoteVideo3": false,"remoteVideo4": false};

var video1 = document.getElementById('remoteVideo1');
var video2 = document.getElementById('remoteVideo2');
var video3 = document.getElementById('remoteVideo3');
var video4 = document.getElementById('remoteVideo4');
var canvas = document.getElementById('snapShotCanvas');

var cam1btn = document.getElementById('cam1btn');
var cam2btn = document.getElementById('cam2btn');
var cam3btn = document.getElementById('cam3btn');
var cam4btn = document.getElementById('cam4btn');

var faceDetectedAudio = document.getElementById("faceDetectedAudio"); 

var loggedUserID = document.getElementById("user").innerHTML;

var currentdate = new Date();
var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
var dd = currentdate.getDate();
var mm = currentdate.getMonth() +1;
var yyyy = currentdate.getFullYear();
var ss = currentdate.getSeconds();
if (ss < 10){
	ss = '0' + ss;
};
if (dd < 10){
	dd = '0' + dd;
};
if (mm < 10){
	mm = '0' + mm;
};
var date_time = dd+'.'+
				mm+'.'+
				yyyy+'_'+
				currentdate.getHours()+'-'+
				currentdate.getMinutes()+'-'+
				ss;

var id = 0;
var ID = function () {
  id++;
  return id;
};

RTCSessionDescription = window.RTCSessionDescription ||
						window.mozRTCSessionDescription;
RTCPeerConnection = window.RTCPeerConnection ||
					window.mozRTCPeerConnection || 
					window.webkitRTCPeerConnection;
RTCIceCandidate = window.RTCIceCandidate ||
				  window.mozRTCIceCandidate;

btnCheck();

function sendThatLoad(){
	socket.emit('free', {'user': loggedUserID});
	socket.emit('load', {'user': loggedUserID});
};

function sendThatUnload(){
	socket.emit('unload', {'user': loggedUserID});
};

function getKeyByValue(object, value) {
	return Object.keys(object).find(key => object[key] === value);
};

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
	};
};

function showVideo(videoNumber){
	switch(videoNumber){
		case 1:
			$("#video1div").css('display', "");
			$("#video2div").css('display', "None");
			$("#video3div").css('display', "None");
			$("#video4div").css('display', "None");
			break;
		case 2:
			$("#video1div").css('display', "None");
			$("#video2div").css('display', "");
			$("#video3div").css('display', "None");
			$("#video4div").css('display', "None");
			break;
		case 3:
			$("#video1div").css('display', "None");
			$("#video2div").css('display', "None");
			$("#video3div").css('display', "");
			$("#video4div").css('display', "None");
			break;
		case 4:
			$("#video1div").css('display', "None");
			$("#video2div").css('display', "None");
			$("#video3div").css('display', "None");
			$("#video4div").css('display', "");
			break;
		case 'all':
			$("#video1div").css('display', "");
			$("#video2div").css('display', "");
			$("#video3div").css('display', "");
			$("#video4div").css('display', "");
			break;
	};
};


//--------------------------------------------- WEBRTC ---------------------------------------------
function getBrowserRTCConnectionObj () {
	var servers = {'iceServers': [
	    {'url':'stun:stun.ekiga.net'},
	    {'url':'stun:stun.fwdnet.net'},
	    {url: 'turn:192.158.29.39:3478?transport=udp',
		 credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
		 username: '28224511:1379330808'
		},
		{url: 'turn:192.158.29.39:3478?transport=tcp',
		 credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
		 username: '28224511:1379330808'}]
		};

	if (window.mozRTCPeerConnection) {
	return new mozRTCPeerConnection(servers);
	} else if (window.webkitRTCPeerConnection) {
	  return new webkitRTCPeerConnection(servers);
	} else if (window.msRTCPeerConnection) {
	  return new msRTCPeerConnection(servers);
	} else {
	return new RTCPeerConnection(servers);
	};
};

function getPeerConnection(){
	var pc = getBrowserRTCConnectionObj();
	id = ID();
	peerConnections[id] = pc;
	pc.onicecandidate = async function(evt){
		if (await evt.candidate) {
			socket.emit('candidate_reciever', { "candidate": await evt.candidate,
												"user": loggedUserID,
												"fromSocket": ownSocket,
												"toSocket": currTransmiterSocket });
			console.log(loggedUserID,'(socket:',ownSocket,') : , sending Ice Candidates');
            console.log('   ', evt.candidate);	
		};
	},function(error){
			console.log(error);
	};

	pc.ontrack = async function(evt){
		if (video1.srcObject === null){
			video1.srcObject = await evt.streams[0];
			var connectionId = getKeyByValue(peerConnections,pc);
			videosConn[connectionId] = video1;
			isAttached["remoteVideo1"] = true;
		}
	
		else if (video2.srcObject === null && video1.srcObject !== null){
			video2.srcObject = await evt.streams[0];
			var connectionId = getKeyByValue(peerConnections,pc);
			videosConn[connectionId] = video2;
			isAttached["remoteVideo2"] = true;
		}
	
		else if (video3.srcObject === null && video2.srcObject !== null){
			video3.srcObject = await evt.streams[0];
			var connectionId = getKeyByValue(peerConnections,pc);
			videosConn[connectionId] = video3;
			isAttached["remoteVideo3"] = true;
		}
	
		else if (video4.srcObject === null && video3.srcObject !== null){
			video4.srcObject = await evt.streams[0];		
			var connectionId = getKeyByValue(peerConnections,pc);
			videosConn[connectionId] = video4;
			isAttached["remoteVideo4"] = true;
		};
		
		btnCheck();
	};
	pc.oniceconnectionstatechange = async function(evt){
		try{
			if (pc.iceConnectionState === 'connected'){
				socket.emit('free', {'user': loggedUserID});
			}
			if (pc.iceConnectionState === "disconnected") { 
				var connectionId = getKeyByValue(peerConnections,pc);
				videosConn[connectionId].srcObject = null;
				isAttached[videosConn[connectionId].id] = false;
				delete videosConn[connectionId];
				delete peerConnections[connectionId];
				btnCheck();
	    	};
    	} catch(err) {
    		console.log(err);
    	};
	};
	return peerConnections[id];
}

function registerIceCandidate(conn) {
	try{
		for(var i = 0; i < TempIceCandidates.length; i++) {
			
			conn.addIceCandidate(TempIceCandidates[i]).catch(e =>{
				console.log('błąd podczas dodawania ICE candidate:',e);
			});
		};
	} catch(err){
		console.log(err);
	};
};
//--------------------------------------------- /WEBRTC ---------------------------------------------

//--------------------------------------------- SOCKET.ON ---------------------------------------------
socket.on('ask', async offer => {
  	try {
    	if (offer.user != loggedUserID){
    		return;
    	};
    	if (!connections[offer.id]) {
    		connections[offer.id] = getPeerConnection();
    	};
	    const connection = connections[offer.id];
	    console.log(loggedUserID,'(socket:',ownSocket,')',': new offer with remote sesion description, from socket:',offer.fromSocket, ',remote connection id:',offer.id);
	    currTransmiterSocket = offer.fromSocket;
	    await connection.setRemoteDescription(JSON.parse(offer.sdp));
	    await connection.setLocalDescription(await connection.createAnswer());
	    await registerIceCandidate(connections[offer.id]);
	    socket.emit('busy', {'user': loggedUserID});
	    socket.emit('response', {'sdp': connection.localDescription,
	                             'user': loggedUserID,
	                             'fromSocket': ownSocket,
	                             'toSocket': offer.fromSocket});
  	} catch (err) {
    	console.log(err);
  	};
});

socket.on('candidate_transmision', function(candidate){
	if (candidate.user != loggedUserID){
		return;
	}
	connections[candidate.id].addIceCandidate( new RTCIceCandidate(candidate.candidate),
        function() {
        	console.log(loggedUserID,'(socket:',ownSocket,')',': new ice candidate registered, from socket:',candidate.fromSocket, ',remote connection id:',candidate.id);
        	console.log('		',candidate.candidate);
        }, function(err) {
          console.error(err);
        });
	
});

socket.on('socket', function(msg){
	if (socketSwitch === true){
		ownSocket = msg;
		socketSwitch = false;
		console.log(time, 'Socket sesji:',ownSocket);  
	};
 });
//--------------------------------------------- /SOCKET.ON ---------------------------------------------

//--------------------------------------------- SNAP SHOTS ---------------------------------------------
var canvas = document.querySelector('canvas');
	var ctx = canvas.getContext('2d');
	var w, h, ratio;
if (video1){
	video1.addEventListener('loadedmetadata', function(){
		ratio = video1.videoWidth / video1.videoHeight;
		w = video1.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h;
	}, false);
};

if (video2){
	video2.addEventListener('loadedmetadata', function(){
		ratio = video2.videoWidth / video2.videoHeight;
		w = video2.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h;
	}, false);
};

if (video3){
	video3.addEventListener('loadedmetadata', function(){
		ratio = video3.videoWidth / video3.videoHeight;
		w = video3.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h
	}, false);
};

if (video4){
	video4.addEventListener('loadedmetadata', function(){
		ratio = video4.videoWidth / video4.videoHeight;
		w = video4.videoWidth - 100;
		h = parseInt(w / ratio, 10);
		canvas.width = w;
		canvas.height = h;
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
	link = null;
};

function snapShotAll(){
	snapShot(remoteVideo1);
	snapShot(remoteVideo2);
	snapShot(remoteVideo3);
	snapShot(remoteVideo4);
};
//--------------------------------------------- /SNAP SHOTS ---------------------------------------------

//--------------------------------------------- FACE DETECTING ---------------------------------------------
function startFaceDetect(){
	stopInterval = false;
	const facedetect = setInterval(function() {
		if(stopInterval === false){
			if (isAttached["remoteVideo1"] === true){
					faceDetect("remoteVideo1");
			};
			if (isAttached["remoteVideo2"] === true){
				faceDetect("remoteVideo2");
			};
			if (isAttached["remoteVideo3"] === true){
				faceDetect("remoteVideo3");
			};
			if (isAttached["remoteVideo4"] === true){
				faceDetect("remoteVideo4");
			};
		};	
	}, 500);
	console.log('Face detection started');
};


function stopFaceDetect(){
	stopInterval = true;
	$('.face').remove();
	console.log('Face detection stoped');
};

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
	                }).insertAfter(this);
				};	                
			};
		}, 
		error: function() {
			console.warn("Could not process image");
		}
	});
};
//--------------------------------------------- /FACE DETECTING ---------------------------------------------