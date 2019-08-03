package com.soo.sootudy.security.direct;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("flag","fail");
		map.put("msg","아이디 혹은 비밀번호가 틀렸습니다");	
		
		request.setAttribute("result", map);
		log.info("map"+map);
		request.getRequestDispatcher("/member/login").forward(request, response);;

//		response.sendRedirect("/member/login");
	}

}
