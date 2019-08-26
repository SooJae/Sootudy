package com.soo.sootudy.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.soo.sootudy.domain.StudyTodoVO;
import com.soo.sootudy.service.StudyTodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/todo")
@RestController
@Slf4j
@AllArgsConstructor
public class TodoController {
	
	@Autowired
	private StudyTodoService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new",
			consumes = "application/json",
					produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> create(@RequestBody StudyTodoVO vo){
		
		log.info("todo register ..." + vo);
		int insertCount = service.register(vo);
		
		return insertCount==1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
		
	}

	@GetMapping(value = "/list/{sno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StudyTodoVO>> getList(@PathVariable("sno") int sno){
		
		
		return new ResponseEntity<>(service.getTodoList(sno), HttpStatus.OK);
	}
//	
//	@GetMapping(value="/{rno}",
//			produces = {MediaType.APPLICATION_XML_VALUE,
//						MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno){
//		log.info("get"+rno);
//		
//		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
//	}
//	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping(value="/{tdno}")
	public ResponseEntity<String> remove(@PathVariable("tdno") int tdno){
		log.info(tdno+"tdno");
		return service.remove(tdno) ==1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{sno}",
			consumes="application/json",
					produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> modify(@RequestBody Map<String, String> todo, @PathVariable("sno") int sno){
		 
		log.info("rno"+sno);
		log.info("modify"+todo);
		return service.check(todo, sno) ==1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	

	
}
