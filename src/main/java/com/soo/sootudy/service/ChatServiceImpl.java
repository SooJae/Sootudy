package com.soo.sootudy.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.mapper.ChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private ChatMapper mapper;
 
    @Override
    public List<ChatRoomDTO> getList() {
        // 채팅방 생성순서 최근 순으로 반환
        return mapper.getList();
    }
  
    @Override
    public ChatRoomDTO getRoomInfo(String id) {
        return mapper.get(id);
    }
    
    //채팅방 생성
    @Override
    public int createChatRoom(String name) {
    	ChatRoomDTO chatRoom = ChatRoomDTO.create(name);
    	return mapper.insert(chatRoom);
    }
}
