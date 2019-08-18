package com.soo.sootudy.service;


import java.util.List;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.domain.StudyVO;
import com.soo.sootudy.mapper.ChatMapper;
import com.soo.sootudy.mapper.StudyChatMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private ChatMapper mapper;
	
	private StudyChatMapper studyChatMapper;
	
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
    @Override
    public ChatRoomDTO studyGetRoom(String id) {
    	return mapper.studyGet(id);
    }
    
    
    
    
    //채팅방 생성
    @Override
    public int createChatRoom(String name) {
    	ChatRoomDTO chatRoom = ChatRoomDTO.create(name);
    	return mapper.insert(chatRoom);
    }
    //스터디 채팅방 생성
    @Override
    public void studyCreateChat(StudyVO study) {
    	mapper.studyCreateChat(study);
    }
    
    @Override
    @Transactional
    public void sendStudyChatMessage(ChatVO chatVO) {
//    	ChatRoomDTO getRoom = mapper.get(chatVO.getRoomId());
//    	chatVO.setUserCnt(getRoom.getCnt());
        if (ChatVO.MessageType.JOIN.equals(chatVO.getType())) {
        	chatVO.setMessage(chatVO.getSender() + "님이 방에 입장했습니다.");
        	chatVO.setSender("[알림]");
        } else if (ChatVO.MessageType.LEAVE.equals(chatVO.getType())) {
        	chatVO.setMessage(chatVO.getSender() + "님이 방에서 나갔습니다.");
        	chatVO.setSender("[알림]");
        } else if(ChatVO.MessageType.CHAT.equals(chatVO.getType())){
        	studyChatMapper.insertSelectKey(chatVO);
        }
        messagingTemplate.convertAndSend("/sub/chat/room/" + chatVO.getRoomId(), chatVO);
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

//이전 채팅 가져오기
	@Override
	public List<ChatVO> getStudyChatMessage(int studyId) {
		return studyChatMapper.read(studyId);
	}

    
    

}
