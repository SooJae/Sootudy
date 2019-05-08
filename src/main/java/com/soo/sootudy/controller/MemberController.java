package com.soo.sootudy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/*			consumes = "application/json",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE}*/
	@ResponseBody
	@PostMapping(value="/check")
	public int readMember(@RequestBody Map<String, String> map) {

		
		MemberVO readCount = service.checkMember(map);
		
		return readCount ==null? 1 :0;
		 
	}
	

}

