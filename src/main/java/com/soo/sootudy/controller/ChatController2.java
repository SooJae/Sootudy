//package com.soo.sootudy.controller;
//
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Controller
//@Slf4j
//public class ChatController {
//	
//	@GetMapping(value = "/chatrooms")
//	public ModelAndView chat(ModelAndView mv) {
//		mv.setViewName("/chatrooms");
//		
//		//사용자 정보 출력(세션)//
//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("user name :" + user.getUsername());
//				
//		System.out.println("normal chat page");
//		
//		mv.addObject("userid", user.getUsername());
//		
//		return mv;
//	}
//
//
//}
//
