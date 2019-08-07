package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;

import com.soo.sootudy.domain.ChatVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ChatController {
	
	private final SimpMessageSendingOperations messagingTemplate;
	 
	
	 @Autowired
	    public ChatController(SimpMessagingTemplate template) {
	        this.messagingTemplate = template;
	    }
	
    @MessageMapping("/chat/message")
    public void message(ChatVO message) {
    	log.info("ChatController");
        if (ChatVO.MessageType.JOIN.equals(message.getType()))
            message.setMessage(message.getSender() + "님이 입장하셨습니다.");
        else if(ChatVO.MessageType.LEAVE.equals(message.getType()))
        	message.setMessage(message.getSender() + "님이 퇴장하셨습니다.");
        log.info("message..."+message);
        messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
    
    

}

