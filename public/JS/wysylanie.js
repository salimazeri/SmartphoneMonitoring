//"use strict";
/*var mysql = require('mysql');
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    port: databasePort,
    database: dataBaseName
});*/
var socket = io.connect();
var ownSocket  = null;
var currRecieverSocket = null;
var socketSwitch = true;
var canConnect = true;
var canSendOffer = true;
var connection = {};
var peerConnections = {};
var isPageLoaded = false;
var currentdate = new Date();
var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
var video = document.getElementById('localVideo');
var options_without_restart = {offerToReceiveAudio: false,
                               offerToReceiveVideo: true,
                               iceRestart: false};
var options_with_restart = {offerToReceiveAudio: false,
                            offerToReceiveVideo: true,
                            iceRestart: true};
var constraints = {
                    audio: false,
                    video: true
                  };
var loggedUserID = document.getElementById("user").innerHTML;
var id = 0;
var ID = function () {
    //return '_' + Math.random().toString(36).substr(2, 9);
    id++;
    return id;
};
RTCSessionDescription = window.RTCSessionDescription ||
  window.mozRTCSessionDescription;
RTCPeerConnection = window.RTCPeerConnection ||
  window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
RTCIceCandidate = window.RTCIceCandidate ||
  window.mozRTCIceCandidate;
window.URL = window.URL || window.webkitURL || window.mozURL || window.msURL;

function randomIDgenerator() {
  var text = "";
  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$";

  for (var i = 0; i < 10; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
};
var randomID = randomIDgenerator();

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
    }
  };

function getPeerConnection(){
  var pc = getBrowserRTCConnectionObj();
  id = ID();
  peerConnections[id] = pc;
  
  pc.onicecandidate = async function(evt){
    try{
        if (await evt.candidate) {
            socket.emit('candidate_transmision', {  "id": randomID,
                                                    "candidate": evt.candidate,
                                                    "user": loggedUserID,
                                                    "fromSocket": ownSocket});
            console.log(loggedUserID,'(socket:',ownSocket, 'id:',randomID,'): , sending Ice Candidates');
            console.log('   ', evt.candidate);
        }
    } catch (err){
        console.log(loggedUserID,'(socket:',ownSocket, 'id:',randomID,'): , sending Ice Candidates error:',error);
    };
  };

  pc.onnegotiationneeded = async e => {
      try{
          sendOfferWrapper();
      } catch(e) {
          console.log(e);
      }; 
  };

  function sendOfferWrapper(){
      setTimeout(async function(){
        if (canSendOffer === true){
          await pc.createOffer(options_without_restart).then(onCreateOfferSuccess, onCreateOfferError);
        } else {
          sendOfferWrapper();
        }
      },1000);
  };

  async function onCreateOfferSuccess(sdp){
      await pc.setLocalDescription(await new RTCSessionDescription(sdp));
      socket.emit('ask', {"id": randomID,
                          "sdp":JSON.stringify(pc.localDescription),
                          "user": loggedUserID,
                          "fromSocket": ownSocket});
      socket.emit('offerLog', {'user': loggedUserID});
      console.log(loggedUserID,'(socket:',ownSocket,'id: ',randomID,')',': send new ask with local session description');
  };

  function onCreateOfferError(error){
      console.log('onCreateOfferError:', error);
  };

  pc.oniceconnectionstatechange = function(event) {
      try{    
          if (pc.iceConnectionState === 'completed' || pc.iceConnectionState === 'connected'){
              $('#initBtn').text("Connected");
              $('#initBtn').prop('disabled', true); 
          };
          if (pc.iceConnectionState === 'failed'){
              $('#initBtn').text('Start transmitting');
              $('#initBtn').prop('disabled', false);
          }; 
          if (pc.iceConnectionState === "disconnected"){
              $('#initBtn').text('Reconnecting');
              $('#initBtn').prop('disabled', true);
              iceRestartWrapper();
          };
      } catch(err) {
        console.log(err);
      };
  };

  function iceRestartWrapper(){
      setTimeout(function(){
        if (isPageLoaded){
          console.log('strona zostala zaladowana')
          setTimeout(function(){
            iceRestart();
          },3000);
        } else {
          console.log('strona nie zostala zaladowana')
          iceRestartWrapper();
        }
      },3000);
  };

  async function iceRestart(event){  
      try{
          await pc.createOffer(options_with_restart).then(onCreateOfferSuccess, onCreateOfferError);
      } catch(error) {
          console.log(error);
      }; 
  };
  return pc;
};

function start() {
    try {
        navigator.mediaDevices.getUserMedia = navigator.mediaDevices.getUserMedia ||
                                 navigator.mediaDevices.webkitGetUserMedia ||
                                 navigator.mediaDevices.mozGetUserMedia;
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia){
            const stream =
                navigator.mediaDevices.getUserMedia(constraints)
                .then(function(stream){
                  if (video.mozSrcObject !== undefined) {
                      video.mozSrcObject = stream;
                  } else {
                      video.srcObject = stream;
                  };
                  var str = stream;
                  pc = getPeerConnection();
                  pc.addTrack(stream.getVideoTracks()[0], stream);
                  video.srcObject = stream;
                })
                .catch(function(err){
                  console.log("getUserMedia error:",err);
                });
        }

    } catch (err) {
        console.error(err);
    };
};
      
socket.on('candidate_reciever', function(candidate){
    if (candidate.user === loggedUserID && candidate.fromSocket === currRecieverSocket){
      pc.addIceCandidate( new RTCIceCandidate(candidate.candidate),
        function() {
            console.log(loggedUserID,'(socket:',ownSocket,')',': new ice candidate registered, from socket:',candidate.fromSocket);
            console.log('   ', candidate.candidate);
        }, function(err) {
          console.error(err);
        });
    }; 
});

socket.on('response', function(remoteSDP){
    try{    
        if (remoteSDP.user === loggedUserID){
            currRecieverSocket = remoteSDP.fromSocket;
            pc.setRemoteDescription(new RTCSessionDescription(remoteSDP.sdp));
            console.log(loggedUserID,'(socket:',ownSocket, 'id:',randomID,'): , response with remote session description, form socket:',remoteSDP.fromSocket);
            console.log('   ',remoteSDP.sdp);
        };
    } catch(err){
      console.log(err);
    };
});

socket.on('busy', function(message){
    if (message.user === loggedUserID){
        canSendOffer = false;
    };
});

socket.on('free', function(message){
    if (message.user === loggedUserID){
        canSendOffer = true;
    };
});

socket.on('load', function(message){
    if (message.user === loggedUserID){
        isPageLoaded = true;
    };
});

socket.on('unload', function(message){
    if (message.user === loggedUserID){
        isPageLoaded = false;
    };
});

socket.on('socket', function(msg){
    if (socketSwitch === true){
        ownSocket = msg;
        console.log(time, 'Socket sesji:',ownSocket);
        socketSwitch = false;  
    };
});

//md5, zabezpieczenie
//zmiana hasla, system email, usuniecie konta
//mdns
 