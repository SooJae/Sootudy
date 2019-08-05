package com.soo.sootudy.service;


import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.soo.sootudy.domain.ChatRoomDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {
	private Map<String, ChatRoomDTO> chatRoomMap;
	 
    @PostConstruct
    private void init() {
        chatRoomMap = new LinkedHashMap<>();
    }
 
    public List<ChatRoomDTO> findAllRoom() {
        // 채팅방 생성순서 최근 순으로 반환
        List chatRooms = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(chatRooms);
        return chatRooms;
    }
 
    public ChatRoomDTO findRoomById(String id) {
        return chatRoomMap.get(id);
    }
 
    public ChatRoomDTO createChatRoom(String name) {
    	ChatRoomDTO chatRoom = ChatRoomDTO.create(name);
        chatRoomMap.put(chatRoom.getRoomId(), chatRoom);
        return chatRoom;
    }
}
