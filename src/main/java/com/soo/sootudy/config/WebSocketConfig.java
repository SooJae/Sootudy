package com.soo.sootudy.config;

import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

import com.soo.sootudy.websocket.ChatHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Bean
	public ServletServerContainerFactoryBean configureWebSocketContainer() {
		ServletServerContainerFactoryBean factory = new ServletServerContainerFactoryBean();
		factory.setMaxBinaryMessageBufferSize(16384); //바이너리 버퍼크리
		factory.setMaxTextMessageBufferSize(16384);	// 텍스트 버퍼 크기
		factory.setMaxSessionIdleTimeout(TimeUnit.MINUTES.convert(30, TimeUnit.MILLISECONDS)); //비동기 세션 타임아웃 시간
		factory.setAsyncSendTimeout(TimeUnit.SECONDS.convert(5, TimeUnit.MILLISECONDS)); //비동기 전송 타임아웃 시간
		return factory;
	}

	@Bean
	public ChatHandler chatHandler() {
		return new ChatHandler();
	}
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		// CORS : setAllowedOrigins("*")
		registry.addHandler(chatHandler(), "/ws/chat").setAllowedOrigins("*").withSockJS();
//		registry.addHandler(chatHandler(), "/ws").setAllowedOrigins("*").withSockJS();
	}
}
