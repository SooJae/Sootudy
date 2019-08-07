<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>

<div class="container">
<%--       <input type="hidden" name="roomId" id="roomId" value='<c:out value="${roomId}"/>'/>
      <input type="hidden" name="member" id="member" value='<c:out value="${member}"/>'/> --%>
    <ul class="chat_box">
    </ul>
   
</div>

 <div>
            <!-- DIRECT CHAT WARNING -->
            <div class="card card-warning direct-chat direct-chat-warning">
              <div class="card-header">
                <h3 class="card-title"><c:out value="${room.name}"/></h3>

                <div class="card-tools">
                  <span data-toggle="tooltip" title="3 New Messages" class="badge bg-danger">3</span>
                  <button type="button" class="btn btn-tool" data-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Contacts"
                          data-widget="chat-pane-toggle">
                    <i class="fas fa-comments"></i></button>
                  <button type="button" class="btn btn-tool" data-widget="remove"><i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages chat-box">
                  <!-- Message. Default to the left -->
<!--                   <div class="direct-chat-msg"> </div> -->

<!--                   <div class="direct-chat-msg right"> </div> -->
                  <!-- /.direct-chat-msg -->
                </div>
                <!--/.direct-chat-messages-->

              </div>
              <!-- /.card-body -->
              <div class="card-footer">
<!--                 <form action="#" method="post"> -->
                  <div class="input-group">
                    <input type="text" name="message" onkeydown="if (event.keyCode == 13) sendMsg()" class="form-control">
                    <span class="input-group-append">
                      <button class="send" type="submit" class="btn btn-warning" onclick ="sendMsg()">쓰기</button>
                    </span>
                  </div>
<!--                 </form> -->
              </div>
              <!-- /.card-footer-->
            </div>
            <!--/.direct-chat -->
          </div>
          <!-- /.col -->


<script type="text/javascript" src="/resources/dist/js/chat.js"></script>

<script>
    	  let ls_roomId = localStorage.getItem("chatInfo.roomId");
    	  let ls_sender = localStorage.getItem("chatInfo.sender");
    	
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

//         getRoomDetail();
        
        
          function connect() {
           // pub/sub event
            ws.connect({}, function() {
            	//전챗
            	ws.subscribe("/sub/chat/room/"+ls_roomId, function(chat) {
                    var recv = JSON.parse(chat.body);
                    recvMessage(recv);
                });
            	ws.send("/pub/chat/message", {}, JSON.stringify({roomId: ls_roomId, type:'JOIN', sender:ls_sender}));
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
    	  messages.unshift({"type":recv.type,"sender":recv.type !='CHAT'?'[알림] - ':'',"message":recv.message});
//     	  chatBox.append('<div>'+ messages[0].sender + ' - ' + messages[0].message +'</div>');
//     	  chatBox.append('<div>'+ messages[0].sender + ' - ' + messages[0].message +'</div>');

          var str ="";
          if(ls_sender != recv.sender){
	          str += '<div class="direct-chat-msg"><div class="direct-chat-infos clearfix"><span class="direct-chat-name float-left">'+ recv.sender +'</span>';
	        	str += '<span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span></div>';
	        	str += '<div class="direct-chat-text ">'+ messages[0].sender + messages[0].message +'</div></div>';
	        	
          } else if(ls_sender ==recv.sender){
        	  str += '<div class="direct-chat-msg right"><div class="direct-chat-infos clearfix"><span class="direct-chat-name float-right">'+recv.sender+'</span>';
        		str += '<span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span></div>';  
        		str += '<div class="direct-chat-text ">'+ messages[0].sender + messages[0].message +'</div></div>';
          }
          chatBox.append(str);
      }
      
      function sendMsg(){
    	  var message = messageInput.val();
          ws.send('/pub/chat/message', {}, JSON.stringify({roomId: ls_roomId, type: 'CHAT', message: message, sender: ls_sender}));
          messageInput.val('');
      }
      
      $(window).bind("beforeunload", function (e){

    	  ws.send('/pub/chat/message', {}, JSON.stringify({roomId: ls_roomId, type: 'LEAVE', message: "나갑니다", sender: ls_sender}));
    	  ws.disconnect();
    	});

</script>        

<%@ include file="../includes/footer.jsp" %>