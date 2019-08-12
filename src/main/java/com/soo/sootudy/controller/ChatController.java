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
	        chatService.sendChatMessage(chatVO);
	    }
	 
	 @MessageMapping("/chat/studyMessage")
	 public void studyMessage(ChatVO chatVO) {
		 chatService.sendStudyChatMessage(chatVO);
	 }
	 
	 
    

}

