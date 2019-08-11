package com.soo.sootudy.service;


import java.util.List;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.domain.StudyVO;
import com.soo.sootudy.mapper.ChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private ChatMapper mapper;
	
	private final SimpMessageSendingOperations messagingTemplate;
 
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
    @Override
    public void sendChatMessage(ChatVO chatVO) {
//    	ChatRoomDTO getRoom = mapper.get(chatVO.getRoomId());
//    	chatVO.setUserCnt(getRoom.getCnt());
        if (ChatVO.MessageType.JOIN.equals(chatVO.getType())) {
        	chatVO.setMessage(chatVO.getSender() + "님이 방에 입장했습니다.");
        	chatVO.setSender("[알림]");
        } else if (ChatVO.MessageType.LEAVE.equals(chatVO.getType())) {
        	chatVO.setMessage(chatVO.getSender() + "님이 방에서 나갔습니다.");
        	chatVO.setSender("[알림]");
        } 
        messagingTemplate.convertAndSend("/sub/chat/room/" + chatVO.getRoomId(), chatVO);
    }

	@Override
	public void studyCreateChat(StudyVO study) {
		mapper.studyCreateChat(study);
	}

    
    
//    @MessageMapping("/chat/message")
//    public void message(ChatVO message) {
//    	log.info("ChatController");
//        if (ChatVO.MessageType.JOIN.equals(message.getType()))
//            message.setMessage(message.getSender() + "님이 입장하셨습니다.");
//        else if(ChatVO.MessageType.LEAVE.equals(message.getType()))
//        	message.setMessage(message.getSender() + "님이 퇴장하셨습니다.");
//        log.info("message..."+message);
//        messagingTemplate.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
//    }

}
