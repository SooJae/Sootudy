package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ChatController {
	
	
	@Autowired
	private ChatService chatService;
	
	 
	 @MessageMapping("/chat/message")
	    public void message(ChatVO chatVO) {
	        // String nickname = jwtTokenProvider.getUserNameFromJwt(token);
	        // 로그인 회원 정보로 대화명 설정
	        // chatVO.setSender(nickname);
	        // 채팅방 인원수 세팅
	        // chatVO.setUserCount(chatRoomRepository.getUserCount(chatVO.getRoomId()));
	        // Websocket에 발행된 메시지를 redis로 발행(publish)
	        chatService.sendChatMessage(chatVO);
	    }
	 
//    @MessageMapping("/chat/message")
//    public void message(ChatVO message) {
//    	log.info("ChatController");
//        if (ChatVO.MessageType.JOIN.equals(message.getType()))
//            message.setMessage(message.getSender() + "님이 입장하셨습니다.");
//        else if(ChatVO.MessageType.LEAVE.equals(message.getType()))
//        	message.setMessage(message.getSender() + "님이 퇴장하셨습니다.");
//        log.info("message..."+message);
//        messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
//    }
    
	 
    

}

