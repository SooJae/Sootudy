package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.service.ChatService;
import com.soo.sootudy.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/study")
@Slf4j
@AllArgsConstructor
@Controller
public class StudyController {

	@Autowired
	private StudyService studyService;
	@Autowired
	private ChatService chatService;
	

	@GetMapping("/list")
	public String list(StudyCriteria scri, Model model) {
		
		
		model.addAttribute("list", studyService.getList(scri));
		int total = studyService.getTotal(scri);
		log.info("total:"+total);
		
		model.addAttribute("pageMaker", new StudyPageDTO(scri,total));
		
		return "/study/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("sno") int sno, @ModelAttribute("scri") Criteria scri ,Model model) {
		log.info("/get or modify");
		
		model.addAttribute("study",studyService.get(sno, scri));
	}
	
	 // 채팅방 입장 화면
    @GetMapping("/enter/{studyId}")
    @ResponseBody
    public ResponseEntity<ChatRoomDTO> studyChatDetail(@PathVariable String studyId) {
    	log.info("join room"+studyId);
    	return new ResponseEntity<>(chatService.getRoomInfo(studyId), HttpStatus.OK);
    }
    // 참가한 채팅방 정보 조회
    @GetMapping("/chat/{studyId}")
    @ResponseBody
    public ResponseEntity<ChatRoomDTO> studyChatInfo(@PathVariable String studyId) {
    	log.info("chat get"+studyId);
    	return new ResponseEntity<>(chatService.getRoomInfo(studyId), HttpStatus.OK);
    }		
//    @PostMapping("/room/cnt")
//    @ResponseBody
//    public ResponseEntity<String> changeCnt(
//			@RequestBody ChatVO vo){
//		
//    	log.info("changeCnt: "+ vo);
//    	
//    	
//		return service.changeCnt(vo) ==1
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//    
//    
//    @ResponseBody
//	@PostMapping(value="/room/getCnt",
//	produces = {
//			MediaType.APPLICATION_JSON_UTF8_VALUE}
//			)
//	public ResponseEntity<Object> getCnt(
//			@RequestBody Map<String,String> map){
//		
//		String roomIdKey= map.get("roomId");
//		return new ResponseEntity<>(service.getRoomInfo(roomIdKey), HttpStatus.OK);
//	}
}
