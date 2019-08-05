package com.soo.sootudy.mapper;

import java.util.List;

import com.soo.sootudy.domain.ChatRoomDTO;

public interface ChatMapper {

	public int insert(ChatRoomDTO chatRoom);

	public ChatRoomDTO get(String id);

	public List<ChatRoomDTO> getList();

}
