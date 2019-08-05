package com.soo.sootudy.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatHandler extends TextWebSocketHandler {
	
		private ObjectMapper objectMapper = new ObjectMapper();
		
		@Autowired
	    private ChatService chatService;
	 
	    @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	        String payload = message.getPayload();
	        log.info("payload {}", payload);
	// 삭제        TextMessage textMessage = new TextMessage("Welcome chatting sever~^^ ");
	// 삭제       session.sendMessage(textMessage);
	        ChatVO chatVO = objectMapper.readValue(payload, ChatVO.class);
	        ChatRoomDTO room = chatService.findRoomById(chatVO.getRoomId());
	        room.handleActions(session, chatVO, chatService);
	    }
	
	
	

}
