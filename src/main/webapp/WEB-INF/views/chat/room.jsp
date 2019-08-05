<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

    <div class="container" id="app">
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
        <ul class="list-group">
            <li class="list-group-item list-group-item-action" onclick="enterRoom(item.roomId)">
                {{item.name}}
            </li>
        </ul>
    </div>
    <!-- JavaScript -->
<script type="text/javascript" src="/resources/dist/js/chat.js"></script>
<script>
    var csrfHeaderName="${_csrf.headerName}";
    var csrfTokenValue="${_csrf.token}";
    $(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    }); 
    
    
 
    /* function showList(page){
        chatService.getList(function(replyCnt, list){
            
            if(page==-1){
              page = Math.ceil(replyCnt/5.0);
              showList(page);
              return;
            }
          
          var str="";
            
            if(list ==null || list.length==0){
              replyUL.html("");
              
              return;
            }
            
            for(var i = 0, len = list.length||0; i<len; i++){
              str+="<li class='left clearfix' data-rno='"+list[i].rno+"' style='border-bottom:1px solid gray; margin-top:20px; margin-left: <c:out value='"+${20*list[i].replyDepth}+"'/>px;'>";
              str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
              str+="<small class='pull-right text-muted'> &nbsp;"+replyService.displayTime(list[i].reply_udt_dt)+"</small>";
              str+="<sec:authentication property='principal' var='pinfo'/><sec:authorize access='isAuthenticated()'><c:if test='${pinfo.username eq board.writer}'>";
              str+="<a href='#'><small class='pull-right text-muted replyDelete'>&nbsp; 삭제</small></a></div></c:if></sec:authorize>";
              str+="<p>"+list[i].reply+"</p></div></li>";
            }
            replyUL.html(str);
            
            showReplyPage(replyCnt);
        }); // end function
      } */
    
    
    
    function showList(){
    	$.getJSON("/chat/rooms",
                function(data){
                  if(data){
                    console.log(data);
                  }
                }).fail(function(xhr,status,err){
                  if(err){
                    console.log(err);
                  }
                });
    	  }
    
      showList();
      
    var room_name = $("input[name='room_name']");
    function createRoom(){
    	console.log("챗안녕");
    	if("" === room_name.val()) {
            alert("방 제목을 입력해 주십시요.");
            return;
        }
    	else {
					chatService.add(room_name.val(),
							function(result){
	 						alert(room_name.val()+"방 개설에 성공하였습니다.");
							room_name.val("");
							/*findAllRoom(); */
					},
					function(){
						alert("채팅방 개설에 실패하였습니다.");
	        });
	    }
    }
    
    function enterRoom(roomId) {
        var sender = prompt('대화명을 입력해 주세요.');
        if(sender != "") {
            localStorage.setItem('wschat.sender',sender);
            localStorage.setItem('wschat.roomId',roomId);
            location.href="/chat/room/enter/"+roomId;
        }
    }
    
    
    
    </script>



<%@ include file="../includes/footer.jsp" %>