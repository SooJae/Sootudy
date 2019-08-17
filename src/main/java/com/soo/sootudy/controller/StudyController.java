package com.soo.sootudy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soo.sootudy.domain.ChatRoomDTO;
import com.soo.sootudy.domain.ChatVO;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyMemberVO;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.domain.StudyVO;
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
	

	//alert값을 위한 map
	Map<String, Object> map = new HashMap<String,Object>();
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public String list(StudyCriteria scri, Model model) {
		
		
		model.addAttribute("list", studyService.getList(scri));
		int total = studyService.getTotal(scri);
		log.info("total:"+total);
		
		model.addAttribute("pageMaker", new StudyPageDTO(scri,total));
		
		return "/study/list";
	}
	//모임 가입
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("join")
	public String join(StudyMemberVO vo, StudyCriteria scri , RedirectAttributes rttr) {
		
		studyService.joinStudy(vo);
		
		map.put("flag","success");
		map.put("msg","가입이 완료되었습니다");
		
		rttr.addFlashAttribute("result",map);
		
		return "redirect:/study/list" + scri.getListLink();
	}
	
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("/register")
	public String register() {
		return "/study/register";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	@Transactional
	public String register(StudyVO study, RedirectAttributes rttr) {
		
		studyService.register(study);
		chatService.studyCreateChat(study);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("flag","success");
		map.put("msg","등록이 완료되었습니다");
		
		rttr.addFlashAttribute("result",map);
		
		return "redirect:/study/list";
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("sno") int sno, @ModelAttribute("scri") Criteria scri ,Model model) {
		log.info("/get or modify");
		
		model.addAttribute("study",studyService.get(sno, scri));
	}
	
	 // 채팅방 입장 화면
	@PreAuthorize("isAuthenticated()")
    @PostMapping("/enter/{studyId}")
    @ResponseBody
    public ResponseEntity<ChatRoomDTO> studyChatDetail(@PathVariable String studyId) {
    	log.info("join room"+studyId);
    	return new ResponseEntity<>(chatService.getRoomInfo(studyId), HttpStatus.OK);
    }
    // 이전 채팅 가져오기
	@PreAuthorize("isAuthenticated()")
    @GetMapping("/chat/{studyId}")
    @ResponseBody
    public ResponseEntity<List<ChatVO>> studyChatInfo(@PathVariable int studyId) {
    	log.info("chat get"+studyId);
    	return new ResponseEntity<>(chatService.getStudyChatMessage(studyId), HttpStatus.OK);
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
