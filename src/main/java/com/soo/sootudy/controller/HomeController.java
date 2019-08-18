package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.PageDTO;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.service.BoardService;
import com.soo.sootudy.service.StudyService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	@Autowired
	private BoardService service;
	@Autowired
	private StudyService studyService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Criteria cri, StudyCriteria scri, Model model) {
		
		
		
		model.addAttribute("bList", service.getList(cri));
		int bTotal = service.getTotal(cri);
		model.addAttribute("bPageMaker", new PageDTO(cri,bTotal));
		
		
		model.addAttribute("sList", studyService.getList(scri));
		int sTotal = studyService.getTotal(scri);
		model.addAttribute("sPageMaker", new StudyPageDTO(scri,sTotal));
		
		 
		return "index";
	}
	
}
