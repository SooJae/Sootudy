package com.soo.sootudy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/study/*")
@Slf4j
@AllArgsConstructor
@Controller
public class StudyController {

	@Autowired
	private StudyService service;
	

	@GetMapping("/list")
	public void list() {
		
	}
	
	@ResponseBody
	@GetMapping(value = "/list/{page}",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<StudyPageDTO> getList(@PathVariable("page") int page) {
		
		StudyCriteria scri = new StudyCriteria(page,10);
		
		log.info("study cri"+scri);
		
		return new ResponseEntity<>(service.getListPage(scri), HttpStatus.OK);
	}
	
	
}
