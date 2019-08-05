<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

<div class="content">
      <input type="hidden" name="roomId" id="roomId" value='<c:out value="${roomId}"/>'/>
      <input type="hidden" name="member" id="member" value='<c:out value="${member}"/>'/>
    <ul class="chat_box">
    </ul>
    <input name="message">
    <button class="send">보내기</button>
</div>

<script>
    $(function () {
    	
    	//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
        var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
        $(document).ajaxSend(function(e, xhr, options){
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        }); 
        
        function findRoom(){
            $.getJSON("/chat/room/"+this.roomId,
                function(data){
                  if(callback){
                    callback(this.room = data.data);
                  }
                }).fail(function(xhr,status,err){
                  if(error){
                    error();
                  }
                });
          }
        
        findRoom();
    	
		    var chatBox = $('.chat_box');
		    var messageInput = $('input[name="message"]');
		    var sendBtn = $('.send');
		    var roomId = $('#roomId').val();
		    var member = $('#member').val();
   
    
        // websocket &amp; stomp initialize
        var sock = new SockJS("/ws-stomp");
        var ws = Stomp.over(sock);
        var reconnect = 0;

        function connect() {
           // pub/sub event
            ws.connect({}, function(frame) {
                ws.subscribe("/sub/chat/room/"+roomId, function(message) {
                    var content = JSON.parse(message.body);
                    chatBox.append('<li>' + content.message + '(' + content.writer + ')</li>');
                });
            	  ws.send("/pub/chat/message", {}, JSON.stringify({chatRoomId: roomId, type:'JOIN', writer:member}));
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
        
        
        sendBtn.click(function () {
            var message = messageInput.val();
            ws.send('/pub/chat/message', {}, JSON.stringify({chatRoomId: roomId, type: 'CHAT', message: message, writer: member}));
            messageInput.val('');
        });
    });
</script>        

<%@ include file="../includes/footer.jsp" %>