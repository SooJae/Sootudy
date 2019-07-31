package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soo.sootudy.domain.StudyCriteria;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/study/*")
public class StudyController {

	@Autowired
	private StudyService service;
	
	@GetMapping("/list")
	public String list(StudyCriteria scri, Model model) {
		
		model.addAttribute("list",service.getList(scri));
		int total = service.getTotal(scri);
		
		return "/study/list";
	}
	
}
