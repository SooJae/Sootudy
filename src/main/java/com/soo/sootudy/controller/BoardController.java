package com.soo.sootudy.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soo.sootudy.domain.BoardAttachVO;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.PageDTO;
import com.soo.sootudy.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	/*
	 * @GetMapping("list") public String list(Criteria cri, Model model) {
	 * log.info("list"); model.addAttribute("list", service.getList(cri)); return
	 * "/board/list"; }
	 */
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		log.info("키워드"+cri.getKeyword());
		
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
  
		board.getAttachList().forEach(attach -> log.info(""+attach)); }
		 
		
		log.info("======================");
		
		service.register(board);
		rttr.addFlashAttribute("result","글이 등록되었습니다.");
		
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri ,Model model) {
		log.info("/get or modify");
		
		log.info("cri"+cri);
		
		
		model.addAttribute("board",service.get(bno, cri));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("modify :"+ board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "수정이 완료되었습니다.");
		}
		
		return "redirect:/board/list" + cri.getListLink();
	}
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr, String writer) {
		
		log.info("remove..."+bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			//delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result","삭제가 완료되었습니다.");
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
		
		if(attachList==null || attachList.isEmpty()) {
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
	

	

}
