package com.soo.sootudy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/chat")
public class ChatRoomController {
	
	@Autowired
	private ChatService service;
	 
    // 채팅 리스트 화면
    @GetMapping("/room")
    public String rooms(Model model) {
    	log.info("room");
        return "/chat/room";
    }
    // 모든 채팅방 목록 반환
    @ResponseBody
    @GetMapping(value="/rooms",
    		produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//    produces = {MediaType.APPLICATION_XML_VALUE,
//    		MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<List<ChatRoomDTO>> getList(){
    	
    	return new ResponseEntity<>(service.getList(),HttpStatus.OK);
    }
    
//    @ResponseBody
//    public List<ChatRoomDTO> room() {
//    	log.info("rooms");
//        return service.getList();
//    }
    
    
    // 채팅방 생성
    @ResponseBody
    @PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//			produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> createRoom(@RequestBody ChatRoomDTO room) {
    	log.info("create room..."+room.getName());
        int insertCount = service.createChatRoom(room.getName());
		return insertCount==1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    // 채팅방 입장 화면
    @GetMapping("/room/enter/{roomId}")
    public String roomDetail(@PathVariable String roomId, Model model) {
    	log.info("join room"+roomId);
    	model.addAttribute("room", service.getRoomInfo(roomId));
        return "/chat/detail";
    }
    // 참가한 채팅방 정보 조회
    @GetMapping("/room/{roomId}")
    @ResponseBody
    public ChatRoomDTO roomInfo(@PathVariable String roomId) {
    	log.info("room get"+roomId);
        return service.getRoomInfo(roomId);
    }		
    


}

