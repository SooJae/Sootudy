<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>


 <section class="container chat-size t-full">
            <!-- DIRECT CHAT WARNING -->
            <div class="card card-warning direct-chat direct-chat-warning ">
              <div class="card-header" style="text-align:center;">
                <h3 class="card-title" ><c:out value="${room.name}"/></h3>

              <!-- /.card-header -->
              <div class="card-body">
              
              
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages chat-box" id="custom-chat" onscroll="custom_chat_scroll()"> </div>
                <!--/.direct-chat-messages-->

              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                  <div class="input-group">
                    <input type="text" name="message" onkeydown="if (event.keyCode == 13) sendMsg()" class="form-control">
                    <span class="input-group-append">
                      <button class="send btn btn-warning" type="submit" onclick ="sendMsg()">쓰기</button>
                    </span>
                  </div>
              </div>
              <!-- /.card-footer-->
            </div>
            <!--/.direct-chat -->
          </section>
          <!-- /.col -->




<script>
    	  var ss_roomId = sessionStorage.getItem("chatInfo.roomId");
    	  var ss_sender = sessionStorage.getItem("chatInfo.sender");
    	
    	//ajaxSend()를 이용한 코드는 모든 AJAX 전송시 CSRF 토큰을 같이 전송하도록 세팅되기 때문에 매번 AJAX 사용 시 beforeSend를 호출해야하는 번거로움을 줄일 수 있다.
        var csrfHeaderName="${_csrf.headerName}";
        var csrfTokenValue="${_csrf.token}";
        $(document).ajaxSend(function(e, xhr, options){
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        }); 
        
		    var chatBox = $('.chat-box');
		    var chatBoxMine = $('.chat-box-mine');
		    var messageInput = $('input[name="message"]');
		    var sendBtn = $('.send');
   
    
        // websocket &amp; stomp initialize
        var sock = new SockJS("/ws-stomp");
        var ws = Stomp.over(sock);
        var reconnect = 0;

        
        
          function connect() {
           // pub/sub event
            ws.connect({}, function() {
            	//전챗
            	ws.subscribe("/sub/chat/room/"+ss_roomId, function(chat) {
                    var recv = JSON.parse(chat.body);
                    recvMessage(recv);
                    updated();

                });
            	ws.send("/pub/chat/message", {}, JSON.stringify({roomId: ss_roomId, type:'JOIN', sender:ss_sender}));
           }, function(error) {
               if(reconnect++ <= 5) {
                   setTimeout(function() {
                       sock = new SockJS("/ws-stomp");
                       ws = Stomp.over(sock);
                       connect();
                   },10*1000);
               }
           });
        }  
          connect();
        
	      var today = new Date();
	      
	      var maxScroll = $(".card-body").height();
	      function recvMessage(recv){
	    	  var messages =[];
	    	  messages.unshift({"type":recv.type,"sender":recv.type !='CHAT'?'[알림] - ':'',"message":recv.message});
	    	  
	    	  
	          var date = (today.getMonth()+1)+'/'+today.getDate() +' '+ today.getHours() + ":" + today.getMinutes();      
	
	          
	         
	          var str ="";
	          if(recv.sender == '[알림]'){
	              str += '<div class="direct-chat-msg notify"><div class="direct-chat-infos clearfix">';
	              str += '<div class="direct-chat-text ">'+ messages[0].sender + messages[0].message +'</div></div>';
	            }
	            else if(ss_sender != recv.sender){
		          str += '<div class="direct-chat-msg left"><div class="direct-chat-infos clearfix"><span class="direct-chat-name float-left">'+ recv.sender +'</span>';
		        	str += '<span class="direct-chat-timestamp float-right">'+ date +'&nbsp;</span></div>';
		        	str += '<div class="direct-chat-text ">'+ messages[0].sender + messages[0].message +'</div></div>';
		        	
	          } else if(ss_sender == recv.sender){
	        	  str += '<div class="direct-chat-msg right"><div class="direct-chat-infos clearfix"><span class="direct-chat-name float-right">&nbsp;'+recv.sender+'</span>';
	        		str += '<span class="direct-chat-timestamp float-left">&nbsp;'+ date +'</span></div>';  
	        		str += '<div class="direct-chat-text ">'+ messages[0].sender + messages[0].message +'</div></div>';
	        		
	          } 
	          
	
	          chatBox.append(str);
	      }
      
      function sendMsg(){
	    	  var message = messageInput.val();
	          ws.send('/pub/chat/message', {}, JSON.stringify({roomId: ss_roomId, type: 'CHAT', message: message, sender: ss_sender}));
	          messageInput.val('');
	      }
	      
	      $(window).bind("beforeunload", function (e){
	
	    	  ws.send('/pub/chat/message', {}, JSON.stringify({roomId: ss_roomId, type: 'LEAVE', message: "나갑니다", sender: ss_sender}));
	    	  sessionStorage.clear(); // 세션 스토리지를 전부 지운다.
	    	  ws.disconnect();
	    	});

      
     
</script>        

<%@ include file="../includes/footer.jsp" %>