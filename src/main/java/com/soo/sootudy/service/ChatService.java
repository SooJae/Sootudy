package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.domain.StudyVO;

public interface ChatService {

	public List<ChatRoomDTO> getList();
	 
    public ChatRoomDTO getRoomInfo(String id);
 
    public int createChatRoom(String name);

    public void sendChatMessage(ChatVO chatVO) ;
    
	public void studyCreateChat(StudyVO study);

	public void sendStudyChatMessage(ChatVO chatVO);


	public List<ChatVO> getStudyChatMessage(int studyId);
	
}
