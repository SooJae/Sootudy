package com.soo.sootudy.mapper;

import java.util.List;

import com.soo.sootudy.domain.ChatVO;

public interface StudyChatMapper {

	public void insertSelectKey(ChatVO chatVO);
	
	public List<ChatVO> read(int roomId);
}
