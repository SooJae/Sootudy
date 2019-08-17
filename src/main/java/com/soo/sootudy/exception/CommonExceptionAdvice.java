package com.soo.sootudy.exception;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class CommonExceptionAdvice {

	
//	@ExceptionHandler(Exception.class)
//	public String except(Exception ex, Model model) {
//		log.error("Exception"+ex.getMessage());
//		model.addAttribute("exception",ex);
//		log.error(""+model);
//		return "/error/error_page";
//	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex , Model model) {
		model.addAttribute("exception","페이지를 찾을 수 없어요");
		return "/error/custom404";
	}
	//중복 Primary Key 일시 발생
	@ExceptionHandler(DataIntegrityViolationException.class)
	@ResponseStatus(HttpStatus.CONFLICT)
	public String handleDuplicateSql(DataIntegrityViolationException ex , Model model) {
		
		model.addAttribute("exception","이미 가입한 모임이에요");
		return "/error/custom404";
	}
}
