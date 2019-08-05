<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

<!-- <div class="ml-5">
  <div id="connect-container" class="ui centered grid">
        <div class="row">
            <button id="connect" onclick="connect();" class="ui green button ">Connect</button>
            <button id="disconnect" disabled="disabled" onclick="disconnect();" class="ui red button">Disconnect</button>
        </div>
        <div class="row">
            <textarea id="message" style="width: 350px" class="ui input" placeholder="Message to Echo"></textarea>
        </div>
        <div class="row">
            <button id="echo" onclick="echo();" disabled="disabled" class="ui button">Echo message</button>
        </div>
    </div>
    <div id="console-container">
        <h3>Logging</h3>
        <div id="logging"></div>
    </div>
</div> -->


  
  <h1>Chatting Page (id: ${userid})</h1>
  <div>
    <input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
  </div>
  <br>
  <div>
    <div>
      <input type="text" id="message"/>
        <input type="button" id="sendBtn" value="전송"/>
      </div>
      <br>
      <div class="well" id="chatdata">
        <!-- User Session Info Hidden -->
        <input type="hidden" value='${userid}' id="sessionuserid">
      </div>
  </div>
<!-- <script type="text/javascript">
$(function(){
  $("#chattinglistbtn").click(function(){
    var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
      title: 'Chatting List',
      type: 'confirmation',
      print: false,
      width: 260,
      buttons: ['닫기'],
      onClose: function(caption){
        if(caption == '닫기'){
          //alert('yes click');
        }
      }
    });
    });
});
</script> -->
<script type="text/javascript">
//websocket을 지정한 URL로 연결
var sock= new SockJS("<c:url value="/ws/chat"/>");
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을때 실행하는 메소드
sock.onclose = onClose;
$(function(){
  $("#sendBtn").click(function(){
    console.log('send message...');
        sendMessage();
    });
});
        
function sendMessage(){      
  //websocket으로 메시지를 보내겠다.
    sock.send($("#message").val());     
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
  var data = evt.data;
  var sessionid = null;
  var message = null;
  
  //문자열을 splite//
  var strArray = data.split('|');
  
  for(var i=0; i<strArray.length; i++){
    console.log('str['+i+']: ' + strArray[i]);
  }
  
  //current session id//
  var currentuser_session = $('#sessionuserid').val();
  console.log('current session id: ' + currentuser_session);
  
  sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
  message = strArray[1]; //현재 메세지를 저장//
  
  //나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
  if(sessionid == currentuser_session){
    var printHTML = "<div class='well'>";
    printHTML += "<div class='alert alert-info'>";
    printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
    printHTML += "</div>";
    printHTML += "</div>";
    
    $("#chatdata").append(printHTML);
  } else{
    var printHTML = "<div class='well'>";
    printHTML += "<div class='alert alert-warning'>";
    printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
    printHTML += "</div>";
    printHTML += "</div>";
    
    $("#chatdata").append(printHTML);
  }
  
  console.log('chatting data: ' + data);
  
    /* sock.close(); */
}
    
function onClose(evt){
  $("#data").append("연결 끊김");
}    
</script>


<%@ include file="includes/footer.jsp" %>