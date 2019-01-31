var socket = io.connect();
var connection = {};
var options_without_restart = {offerToReceivseAudio: false,
                               offerToReceiveVideo: true,
                               iceRestart: false};

var options_with_restart = {offerToReceiveAudio: false,
                            offerToReceiveVideo: true,
                            iceRestart: true};

var loggedUserID = document.getElementById("user").innerHTML;

function getBrowserRTCConnectionObj () {
  var servers = {'iceServers': [{'url': 'stun:stun.services.mozilla.com'}, {'url': 'stun:stun.l.google.com:19302'}]};

  if (window.mozRTCPeerConnection) {
    return new mozRTCPeerConnection(servers);
  } else if (window.webkitRTCPeerConnection) {
      return new webkitRTCPeerConnection(servers);
  } else if (window.msRTCPeerConnection) {
      return new msRTCPeerConnection(sservers);
  } else {
    return new RTCPeerConnection(servers);
  }
}

function init(options = options_without_restart){
    navigator.getUserMedia = navigator.getUserMedia ||
                             navigator.webkitGetUserMedia ||
                             navigator.mozGetUserMedia;
    if (navigator.getUserMedia) {
      navigator.getUserMedia({
        audio: false,
        video: true
      }, function(stream) {
        connection = getBrowserRTCConnectionObj();
        connection.addStream(stream);
        connection.onicecandidate = function (evt) {
          if (evt.candidate) {
            socket.emit('candidate_transmision', { "candidate": evt.candidate,
                                                    "user": loggedUserID });
            console.log(`wysylanie: ICE candidate:\n${evt.candidate ? evt.candidate.candidate : '(null)'}`);
          }
        };

        connection.oniceconnectionstatechange = function(event){
      
          if(connection.iceConnectionState === "disconnected"){
            console.log('wykryto rozlaczenie, restartuje ICE');
            setTimeout(function(){init(options_with_restart)}, 2000);  
          };
        };

        connection.createOffer(options).then(
          function(offer){
              connection.setLocalDescription(offer);
              socket.emit('ask', {"offer":JSON.stringify(offer),
                                  "user": loggedUserID});
              console.log('wysylanie: wyslalem oferte do odbierania:', offer)
          },
          function(err){
            console.log(err);
          });
      
      }, function(e) {
        console.error("You are not allow navigator use device", e);
      })
    }
  };

socket.on('candidate_reciever', function(candidate){
  if (candidate.user === loggedUserID){
    console.log('candidate_reciever');
    connection.addIceCandidate( new RTCIceCandidate(candidate.candidate),
      function() {
        console.log('AddIceCandidate success!');
    }, function(err) {
        console.error('Error AddIceCandidate');
        console.error(err);
      })
  }
  
});

socket.on('response', function(bobDesc){
  if (bobDesc.user === loggedUserID){
    var bobDesc = bobDesc.bobDesc;
    connection.setRemoteDescription(new RTCSessionDescription(bobDesc));
  }
  
})

//md5, zabezpieczenie
//podział widoku na 1 kamere, 2, 3, 4 albo wszystkie
//system logów
//mdns
//przycisk do zrobienia wszystkich zdjęć
//obsługa zdarzenia usuniecia RTCPeerConnection + usuwanie go z listty peerConnections
