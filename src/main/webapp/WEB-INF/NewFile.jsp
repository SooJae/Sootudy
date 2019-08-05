<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>{{room.name}}({{room.id}})</h1>
<div class="content" data-room-id="{{room.id}}" data-member="{{member}}">
    <ul class="chat_box">
    </ul>
    <input name="message">
    <button class="send">보내기</button>
</div>
<script>
    $(function () {
        var chatBox = $('.chat_box');
        var messageInput = $('input[name="message"]');
        var sendBtn = $('.send');
        var roomId = $('.content').data('room-id');
        var member = $('.content').data('member');

        var sock = new SockJS("/stomp-chat");
        var client = Stomp.over(sock);
        client.debug = function (e) {
        };

        client.connect({}, function () {
            client.send('/publish/chat/join', {}, JSON.stringify({chatRoomId: roomId, type: 'JOIN', writer: member}));
            client.subscribe('/subscribe/chat/room/' + roomId, function (chat) {
                var content = JSON.parse(chat.body);
                chatBox.append('<li>' + content.message + '(' + content.writer + ')</li>')
            });
        });

        sendBtn.click(function () {
            var message = messageInput.val();
            client.send('/publish/chat/message', {}, JSON.stringify({chatRoomId: roomId, type: 'CHAT', message: message, writer: member}));
            messageInput.val('');
        });
    });
    
    </script>