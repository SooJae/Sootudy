<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- <script type="text/javascript" src="/resources/dist/js/webSocket.js"></script> -->

<div class="container" id="app">
        <div>
            <h2>채팅방 리스트</h2>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <label class="input-group-text">내용</label>
            </div>
            <input type="text" class="form-control">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" onclick="sendMessage();">보내기</button>
            </div>
        </div>
        <ul class="list-group">
            <li class="list-group-item" id="greetings">
                {{message.sender}} - {{message.message}}
            </li>
        </ul>
        <div></div>
    </div>
    <!-- JavaScript -->
    <script src="/webjars/vue/2.5.16/dist/vue.min.js"></script>
    <script src="/webjars/axios/0.17.1/dist/axios.min.js"></script>

    <script>
        //alert(document.title);
        // websocket &amp; stomp initialize
        var sock = new SockJS("/ws-stomp");
        var ws = Stomp.over(sock);
        var reconnect = 0;
        // vue.js
        
         function sendMessage() {
             ws.send("/pub/chat/message", {}, JSON.stringify({type:'TALK', roomId:this.roomId, sender:this.sender, message:this.message}));
             this.message = '';
            }
        
        
         function showChat(chat) {
        	    $("#greetings").append("<tr><td>" + chat.name + " : " + chat.message + "</td></tr>");
        	  }
        var vm = new Vue({
            el: '#app',
            data: {
                roomId: '',
                room: {},
                sender: '',
                message: '',
                messages: []
            },
            created() {
                this.roomId = localStorage.getItem('wschat.roomId');
                this.sender = localStorage.getItem('wschat.sender');
                this.findRoom();
            },
            methods: {
                findRoom: function() {
                    axios.get('/chat/room/'+this.roomId).then(response => { this.room = response.data; });
                },
               
                recvMessage: function(recv) {
                    this.messages.unshift({"type":recv.type,"sender":recv.type=='ENTER'?'[알림]':recv.sender,"message":recv.message})
                }
            }
        });
 
        function connect() {
            // pub/sub event
            ws.connect({}, function(frame) {
                ws.subscribe("/sub/chat/room/"+vm.$data.roomId, function(message) {
                    var recv = JSON.parse(message.body);
                    vm.recvMessage(recv);
                });
                ws.send("/pub/chat/message", {}, JSON.stringify({type:'ENTER', roomId:vm.$data.roomId, sender:vm.$data.sender}));
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
    </script>
<script>

function connect() {
	  var socket = new SockJS('/websocket');
	  ws = Stomp.over(socket);
	  ws.connect({}, function (frame) {
	    // ...

	    /* 이 부분 추가 */
	    ws.subscribe('/topic/chat', function (chat) {
	      showChat(JSON.parse(chat.body));
	    });
	  });
	}

	// ... 중략 ...

	/* Chat과 관련된 메서드 추가 */
	function sendChat() {
		ws.send("/app/chat", {}, JSON.stringify({'name': $("#name").val(), 'message': $("#chatMessage").val()}));
	}


	$(function () {
	  // ...
	  
	  $( "#chatSend" ).click(function(){ sendChat(); }); // 추가
	});
</script>

<%@ include file="includes/footer.jsp" %>