package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.ChatRoomDTO;

public interface ChatService {

	public List<ChatRoomDTO> getList();
	 
    public ChatRoomDTO getRoomInfo(String id);
 
    public int createChatRoom(String name);

	
}
