package com.soo.sootudy.config;

import java.util.List;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soo.sootudy.filter.HTMLCharacterEscapes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@EnableWebMvc
@ComponentScan(basePackages = {"com.soo.sootudy.controller"})
@EnableGlobalMethodSecurity(prePostEnabled=true, securedEnabled=true)
@Configuration
public class ServletConfig implements WebMvcConfigurer {

	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		registry.viewResolver(bean);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}    
//	 
//	// ajax & websocket xss 공격 방지 ver.2
//	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//		
//		//직접만든 escapeConverter 
//		converters.add(escapingConverter());
//		
//		//이미지를 위한 Converter(없으면 text/html로 변환되어 오류발생.)
//		converters.add(new ByteArrayHttpMessageConverter());
//		
//	}
//	
//	
//	 private HttpMessageConverter<?> escapingConverter() {
//         ObjectMapper objectMapper = new ObjectMapper();
//         //  ObjectMapper에 특수 문자 처리 기능 적용
//         objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());
//
//         // MessageConverter에 ObjectMapper 설정
//         MappingJackson2HttpMessageConverter htmlEscapingConverter =
//                 new MappingJackson2HttpMessageConverter();
//         htmlEscapingConverter.setObjectMapper(objectMapper);
//
//         return htmlEscapingConverter;
//     }

}