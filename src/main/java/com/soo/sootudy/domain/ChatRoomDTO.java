package com.soo.sootudy.domain;

import java.util.UUID;

import lombok.Getter;

@Getter
public class ChatRoomDTO {
    private String roomId;
    private String name;
 
    public static ChatRoomDTO create(String name) {
    	ChatRoomDTO chatRoom = new ChatRoomDTO();
        chatRoom.roomId = UUID.randomUUID().toString();
        chatRoom.name = name;
        return chatRoom;
    }
}
