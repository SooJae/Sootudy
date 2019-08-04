package com.soo.sootudy.websocket;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.soo.sootudy.security.domain.CustomUser;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Autowired 
	private CustomUser customUser; 
	
	@Override 
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, 
			WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception { 
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		attributes.put("HTTP.SESSION.ID", customUser.findBy(user.getUsername())); 
		return super.beforeHandshake(request, response, wsHandler, attributes); 
		}
	

}
