package com.soo.sootudy.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soo.sootudy.domain.BoardAttachVO;
import com.soo.sootudy.domain.BoardLikeVO;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.PageDTO;
import com.soo.sootudy.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
//@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total:"+total);
		log.info("키워드"+cri.getKeyword());
		
		
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		return "/board/list";
	}
	
	@PreAuthorize("isAuthenticated()")	
	@GetMapping("/register")
	public String register() {
		return "/board/register";
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(@ModelAttribute("cri") Criteria cri, BoardVO board, RedirectAttributes rttr) {
		log.info("======================");
		
		log.info("register: " + board);
		
		
		if(board.getAttachList() != null) {
  
		board.getAttachList().forEach(attach -> log.info(""+attach)); 
		}
		 
		
		log.info("=======================");
		
		service.register(board);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("flag","success");
		map.put("msg","등록이 완료되었습니다");
		
		rttr.addFlashAttribute("result",map);
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri ,Model model) {
		log.info("/get or modify");
		
		model.addAttribute("board",service.get(bno, cri));
	}
	
	// boardVO를 인자로 받고있기때문에 쉽게 board.writer을 사용해서 확인해준다.
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("modify... :"+ board);
		Map<String, Object> map = null;
		if(service.modify(board)) {
			map = new HashMap<String,Object>();
			map.put("flag","success");
			map.put("msg","수정이 완료되었습니다");
		} 
		else {
			map = new HashMap<String,Object>();
			map.put("flag","fail");
			map.put("msg","수정에 실패하였습니다");
		}
		rttr.addFlashAttribute("result",map);
		
		return "redirect:/board/list" + cri.getListLink();
	}
	// 위의 modify와는 달리 bno만 받았기 때문에 writer을 사용해준다. #writer == <input name='writer'>
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr, String writer) {
		
		log.info("remove..."+bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			//delete Attach Files
			deleteFiles(attachList);

			Map<String, Object> map = new HashMap<String,Object>();
			map.put("flag","success");
			map.put("msg","삭제가 완료되었습니다");
			
			rttr.addFlashAttribute("result",map);
		}
		//UriComponentsBuilder 덕분에 일일이 파라미터를 추가할 필요가 없다.
		/* 
		 * rttr.addAttribute("page", cri.getPage()); 
		 * rttr.addAttribute("perPageNum", cri.getPerPageNum()); 
		 * rttr.addAttribute("type", cri.getType());
		 * rttr.addAttribute("keyword", cri.getKeyword());
		 */
		return "redirect:/board/list" + cri.getListLink();
	}
	
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		
		log.info("getAttachList "+bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
//		if(attachList==null || attachList.size() == 0) {
		if(attachList==null || attachList.size() <= 0) {
			return;
		}
		
		attachList.forEach(attach->{
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+ attach.getUuid()+"_"+ attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error "+ e.getMessage());
			}
		});
		
	}
	
	@ResponseBody
	@PostMapping(value="/like")
	public ResponseEntity<String> upLike(
			@RequestBody BoardLikeVO vo){
		
		return service.like(vo) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	
	@ResponseBody
	@PostMapping(value="/getLike",
	produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE}
			)
	public ResponseEntity<Object> getLike(
			@RequestBody Map<String,Integer> map){
		
		int bnoKey= map.get("bno");
		return new ResponseEntity<>(service.getLikes(bnoKey), HttpStatus.OK);
	}
	

	

}

