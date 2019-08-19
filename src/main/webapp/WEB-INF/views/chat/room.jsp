<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

    <div class="container" >
        <div class="row">
            <div class="col-md-12">
                <h3>채팅방 리스트</h3>
            </div>
        </div>
		        <div class="input-group">
		            <div class="input-group-prepend">
		                <label class="input-group-text">방제목</label>
		            </div>
		            <input type="text" class="form-control" name="room_name" onkeydown = "if (event.keyCode == 13) createRoom()">
		            <div class="input-group-append">
		                <button class="btn btn-primary" type="button" onclick="createRoom()">채팅방 개설</button>
		            </div>
		        </div>
        <ul class="list-group" id="chatList-ul">
            
        </ul>
    </div>
    <!-- JavaScript -->
<script type="text/javascript" src="/resources/dist/js/chat.js"></script>
<script>
$(function(){
	    var csrfHeaderName="${_csrf.headerName}";
	    var csrfTokenValue="${_csrf.token}";
	    $(document).ajaxSend(function(e, xhr, options){
	      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    }); 
	    
	    
	    showList();
	    

	    $("#chatList-ul").on("click",".chatList-li",function(e){
	        e.preventDefault();
	        var roomId =$(this).data("cno");  
	      
	        enterRoom(roomId);
	       });
	   
	    function enterRoom(roomId) {
	    	var pattern = /[\S]/i;
	    	if(!sessionStorage.getItem('chatInfo.sender')){
	    		var sender = prompt('대화명을 입력해 주세요.');
            if(pattern.test(sender) && sender != null ) {
              sessionStorage.setItem('chatInfo.sender',sender);
              sessionStorage.setItem('chatInfo.roomId',roomId);
              location.href="/chat/room/enter/"+roomId;
            } else{
            	return;
            }
	    	} else {
	    		location.href="/chat/room/enter/"+roomId;
	    	}
	        
	    }
	    
	     
});
   


var room_name = $("input[name='room_name']");

function createRoom(){
  if("" === room_name.val()) {
        alert("방 제목을 입력해 주십시요.");
        return;
    }
  else {
      chatService.add(room_name.val(),
          function(result){
          alert(room_name.val()+"방 개설에 성공하였습니다.");
          room_name.val("");
          showList();
      },
      function(){
        alert("채팅방 개설에 실패하였습니다.");
      });
  }
}
 


function showList(){
  $.getJSON("/chat/rooms.json",
            function(data){
              var html="";
              $.each(data, function(index, value) {
                 html+="<a href='#'><li class='list-group-item list-group-item-action chatList-li'";
                 html+=" data-cno='"+value.roomId+"'>"+value.name+"</li></a>";
              });
              $("#chatList-ul").html(html);
  }).fail(function(xhr,status,err){
              if(err){
                console.log(err);
              }
            });
    }
    
    </script>



<%@ include file="../includes/footer.jsp" %>