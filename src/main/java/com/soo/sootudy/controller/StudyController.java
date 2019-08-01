package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/study/*")
@AllArgsConstructor
public class StudyController {

	@Autowired
	private StudyService service;
	
//	@PostMapping(value = "/list",
//	consumes = "application/json",
//	produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> list(StudyCriteria scri, Model model) {
//		
//		model.addAttribute("list",service.getList(scri));
//		int total = service.getTotal(scri);
//		
//		return "/study/list";
//	}
	
	@GetMapping("/list")
	public String list() {
		return "/study/list";
	}
	
	@GetMapping("/get")
	public String get() {
		return "/study/get";
	}
	
}
