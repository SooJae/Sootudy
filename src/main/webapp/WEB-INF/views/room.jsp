<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

  <body>
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
            <input type="text" class="form-control" v-model="room_name" onkeydown = "if (event.keyCode == 13) createRoom()">
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
     
    <script>
    
    function findAllRoom(){
    	$.getJSON("/chat/rooms",
                function(data){
                  if(callback){
                    callback(this.chatrooms = data.data);
                  }
                }).fail(function(xhr,status,err){
                  if(error){
                    error();
                  }
                });
    	  }
    
    findAllRoom();
    
    function createRoom(){
    	if("" === this.room_name) {
            alert("방 제목을 입력해 주십시요.");
            return;
        }
    	else {
            var params = new URLSearchParams();
            params.append("name",this.room_name);
            
            $.ajax({
                type:'post',
                url:'/chat/room',
                data:params,
                contentType:"application/json; charset=utf-8",
                success: function(data){
                  if(callback){
                	  alert(response.data.name+"방 개설에 성공하였습니다.")
                      this.room_name = '';
                      this.findAllRoom();
                  }
                },
                error: function(xhr, status, err){
                  if(error){
                	  alert("채팅방 개설에 실패하였습니다.");
                    error(err);
                  } 
                }
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
  </body>
</html>



<%@ include file="includes/footer.jsp" %>