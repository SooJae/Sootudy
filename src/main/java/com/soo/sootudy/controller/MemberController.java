package com.soo.sootudy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soo.sootudy.domain.MemberVO;
import com.soo.sootudy.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr){
		log.info(""+vo);
		service.register(vo);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("flag","success");
		map.put("msg","가입에 성공하였습니다");
		
		rttr.addFlashAttribute("result",map);
		
		return "redirect:/board/list";
	}
	
	
	/*			consumes = "application/json",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE}*/
	@ResponseBody
	@PostMapping(value="/check")
	public int readMember(@RequestBody Map<String, String> map) {

		
		MemberVO readCount = service.checkMember(map);
		
		return readCount ==null? 1 :0;
		 
	}
	
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied : "+ auth);
		model.addAttribute("msg","access denied");
	}
	
	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		log.info("error:"+error);
		log.info("logout:" + logout);
		
		if(error!=null) {
			model.addAttribute("error","Login Error Check Your Account");
		}
		
		if(logout!=null) {
			model.addAttribute("logout","logout!!!!");
		}
	}
	
	@PostMapping("/logout")
	public void logoutPost() {
		log.info("post custom logout");
	}
	

}

