package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.ChatRoomDTO;

public interface ChatService {

	public List<ChatRoomDTO> findAllRoom() ;
	 
    public ChatRoomDTO findRoomById(String id) ;
 
    public ChatRoomDTO createChatRoom(String name) ;
	
}
