//package com.soo.sootudy.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Profile;
//import org.springframework.messaging.handler.annotation.MessageMapping;
//import org.springframework.messaging.simp.SimpMessageSendingOperations;
//import org.springframework.stereotype.Controller;
//
//import com.soo.sootudy.domain.ChatVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Profile("stomp")
//@Controller
//@Slf4j
//public class ChatController {
//	
//	@Autowired
//	private SimpMessageSendingOperations messagingTemplate;
//	 
//	
//    @MessageMapping("/chat/message")
//    public void message(ChatVO message) {
//    	log.info("ChatController");
//        if (ChatVO.MessageType.JOIN.equals(message.getType()))
//            message.setMessage(message.getSender() + "님이 입장하셨습니다.");
//        
//        log.info("message..."+message);
//        messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
//    }
//    
//
//}
//
