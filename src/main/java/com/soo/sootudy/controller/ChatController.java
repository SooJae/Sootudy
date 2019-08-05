package com.soo.sootudy.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.soo.sootudy.domain.ChatVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	
	private SimpMessageSendingOperations messagingTemplate;
	 
    @MessageMapping("/chat/message")
    public void message(ChatVO message) {
        if (ChatVO.MessageType.JOIN.equals(message.getType()))
            message.setMessage(message.getSender() + "님이 입장하셨습니다.");
        messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
	

}

