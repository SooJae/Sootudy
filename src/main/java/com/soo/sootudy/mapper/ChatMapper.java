package com.soo.sootudy.mapper;

import java.util.List;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.StudyVO;

public interface ChatMapper {

	public int insert(ChatRoomDTO chatRoom);

	public ChatRoomDTO get(String roomId);
	public ChatRoomDTO studyGet(String roomId);

	public List<ChatRoomDTO> getList();



	public int updateCnt(String roomId, int cnt);


	public void studyCreateChat(StudyVO study);

}
