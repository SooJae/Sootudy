<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

<div class="container">
<%--       <input type="hidden" name="roomId" id="roomId" value='<c:out value="${roomId}"/>'/>
      <input type="hidden" name="member" id="member" value='<c:out value="${member}"/>'/> --%>
      <div>
            <h2><c:out value="${room.name}"/></h2>
        </div>
    <ul class="chat_box">
    </ul>
    <input name="message" onkeydown = "if (event.keyCode == 13) sendMsg()">
    <button class="send" onclick ="sendMsg()">보내기</button>
</div>

<script type="text/javascript" src="/resources/dist/js/chat.js"></script>

<script>
    	  let roomId = localStorage.getItem("chatInfo.roomId");
    	  let sender = localStorage.getItem("chatInfo.sender");
    	
    	//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
        var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
        $(document).ajaxSend(function(e, xhr, options){
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        }); 
        
		    var chatBox = $('.chat_box');
		    var messageInput = $('input[name="message"]');
		    var sendBtn = $('.send');
   
    
        // websocket &amp; stomp initialize
        var sock = new SockJS("/ws-stomp");
        var ws = Stomp.over(sock);
        var reconnect = 0;

//         getRoomDetail();
        
        
          function connect() {
           // pub/sub event
            ws.connect({}, function() {
            	//전챗
            	ws.subscribe("/sub/chat/room/"+roomId, function(chat) {
                    var recv = JSON.parse(chat.body);
                    recvMessage(recv);
                });
            	ws.send("/pub/chat/message", {}, JSON.stringify({roomId: roomId, type:'JOIN', sender:sender}));
           }, function(error) {
               if(reconnect++ <= 5) {
                   setTimeout(function() {
                       console.log("connection reconnect");
                       sock = new SockJS("/ws-stomp");
                       ws = Stomp.over(sock);
                       connect();
                   },10*1000);
               }
           });
        }  
          connect();
        
//         function getRoomDetail(){
//         	  $.getJSON("/chat/room/"+roomId,
//         	            function(data){
//         	              let obj ={"roomId": data.roomId, "name": data.name};
//         	              console.log("obj"+data.roomId+"name"+data.name);
//         	  }).fail(function(xhr,status,err){
//         	              if(err){
//         	                console.log(err);
//         	              }
//         	            });
//         	  }
        
      
      function recvMessage(recv){
    	  var messages =[];
    	  messages.unshift({"type":recv.type,"sender":recv.type !='CHAT'?'[알림]':recv.sender,"message":recv.message});
    	  chatBox.append('<li>'+ messages[0].sender + ' - ' + messages[0].message +'</li>');
      }
      
      function sendMsg(){
    	  var message = messageInput.val();
          ws.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, type: 'CHAT', message: message, sender: sender}));
          messageInput.val('');
      }
      
      $(window).bind("beforeunload", function (e){

    	  ws.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, type: 'LEAVE', message: "나갑니다", sender: sender}));
    	  ws.disconnect();
    	});

</script>        

<%@ include file="../includes/footer.jsp" %>