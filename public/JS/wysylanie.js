var socket = io.connect();
var ownSocket = null;
var socketSwitch = true;
var canConnect = true;
var connection = {};
var currRecieverSocket = null;
var peerConnections = {};
var track, sender;
var dc = null;
var isPageLoaded = false;
var currentdate = new Date();
var connectionNumber = 1;
var time = currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
var video = document.getElementById('localVideo');
var options_without_restart = {offerToReceivseAudio: false,
                               offerToReceiveVideo: true,
                               iceRestart: false};

var options_with_restart = {offerToReceiveAudio: false,
                            offerToReceiveVideo: true,
                            iceRestart: true};


var loggedUserID = document.getElementById("user").innerHTML;
var id = 0;
var ID = function () {
    //return '_' + Math.random().toString(36).substr(2, 9);
    id++;
    return id;
};

function getBrowserRTCConnectionObj () {
var servers = {'iceServers': [
    {url:'stun:stun01.sipphone.com'},
    {url:'stun:stun.ekiga.net'},
    {url:'stun:stun.fwdnet.net'},
    {
      url: 'turn:numb.viagenie.ca',
      credential: 'muazkh',
      username: 'webrtc@live.com'
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

//setInterval(function(){console.log(canConnect)}, 100);

function makeid() {
  var text = "";
  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$";

  for (var i = 0; i < 10; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
}

socket.on('load', function(){
  isPageLoaded = true;
})
socket.on('unload', function(){
  isPageLoaded = false;
})

function getPeerConnection(){
  var pc = getBrowserRTCConnectionObj();
  id = ID();
  peerConnections[id] = pc;

  pc.onicecandidate = function(evt){
    try{
        if (evt.candidate) {
            socket.emit('candidate_transmision', { "candidate": evt.candidate,
                                                    "user": loggedUserID,
                                                    "socket": ownSocket,
                                                    "toSocket": currRecieverSocket});
        }
    } catch (err){
      console.log(err)
    }
  }
  //var isNegotiating = false;
  pc.onnegotiationneeded = async e => {
      //if (isNegotiating){
      //  console.log('skipping negotiation')
      //  return;
      //}
      //isNegotiating = true;
      try{
          await pc.createOffer(options_without_restart).then(onCreateOfferSuccess, onCreateOfferError)
      } catch(e) {
          console.log(e);
      }
      
  }

  async function onCreateOfferSuccess(sdp){
      //console.log(sdp);
      await pc.setLocalDescription(await new RTCSessionDescription(sdp));
      console.log(connectionNumber);
      socket.emit('ask', {"id": makeid(),
                          "sdp":JSON.stringify(pc.localDescription),
                          "user": loggedUserID,
                          "fromSocket": ownSocket});
      console.log('offercreated');
  }
  function onCreateOfferError(error){
    console.log('onCreateOfferError:', error);
  }

  pc.oniceconnectionstatechange = function(event) {
      try{    
          console.log(pc.iceConnectionState);
          if (pc.iceConnectionState === 'completed'){
              $('#initBtn').css('display', 'none');
          }
          if (pc.iceConnectionState === 'failed'){
              $('#initBtn').css('display', '');
              $('#initBtn').prop('disabled', false)
          } 
          if (pc.iceConnectionState === "disconnected"){
            restartOnPageLoad();
          }
      } catch(err) {
        console.log(err)
      }
  }

  function restartOnPageLoad(){
    setTimeout(function(){
      if (isPageLoaded){
        console.log('strona zostala zaladowana')
        setTimeout(function(){
          iceRestart();
        })
      } else {
        console.log('strona nie zostala zaladowana')
        restartOnPageLoad()
      }
    },3000);
  }

  async function iceRestart(event){  
      try{
          console.log(time, 'Strona z oglądaniem nie jest zajęta, restartuje ice');
          await pc.createOffer(options_without_restart).then(onCreateOfferSuccess, onCreateOfferError);
      } catch(error) {
          console.log(error);
      } 
  }
  return pc;
}

function start() {
    try {

        $('#initBtn').prop('disabled', true);
        navigator.getUserMedia = navigator.getUserMedia ||
                                 navigator.webkitGetUserMedia ||
                                 navigator.mozGetUserMedia;

        if (navigator.getUserMedia){
            const stream =
                navigator.getUserMedia({
                    audio: false,
                    video: true
                }, function(stream){
                    var str = stream;
                    pc = getPeerConnection();
                    pc.addTrack(stream.getVideoTracks()[0], stream);
                    video.srcObject = stream;    
                }, function(error){
                    console.log(error);
                });
          
        }

    } catch (err) {
        console.error(err);
    }
}
      
socket.on('candidate_reciever', function(candidate){
    if (candidate.user === loggedUserID && candidate.fromSocket === currRecieverSocket){
      pc.addIceCandidate( new RTCIceCandidate(candidate.candidate),
        function() {
        }, function(err) {
          console.error(err);
        })
  }
  
});

socket.on('response', function(remoteSDP){
    try{    
        if (remoteSDP.user === loggedUserID){
            currRecieverSocket = remoteSDP.fromSocket;
            pc.setRemoteDescription(new RTCSessionDescription(remoteSDP.sdp));
        }
    } catch(err){
      console.log(err);
    }

})

socket.on('busy', function(msg){
    if (msg.user === loggedUserID){
      $('#initBtn').prop('disabled', true);
      canConnect = false;
    }
})

socket.on('free', function(msg){
    if (msg.user === loggedUserID){
      $('#initBtn').prop('disabled', false);
      canConnect = true;
    }
})

socket.on('socket', function(msg){
    if (socketSwitch === true){
      ownSocket = msg;
      console.log(time, 'Socket sesji: ',ownSocket);
      socketSwitch = false;  
    }
  
})

//md5, zabezpieczenie
//system logów
//mdns
//przycisk do zrobienia wszystkich zdjęć
//obsługa zdarzenia usuniecia RTCPeerConnection + usuwanie go z listty peerConnections
 