package com.soo.sootudy.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soo.sootudy.filter.HTMLCharacterEscapes;

@Configuration
public class HttpMessageConverterConfig extends WebMvcConfigurationSupport{

	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(escapingConverter());
		super.addDefaultHttpMessageConverters(converters);  // default Http Message Converter  추가
	}
	
	@Bean
	 public HttpMessageConverter<?> escapingConverter() {
         ObjectMapper objectMapper = new ObjectMapper();
         // 3. ObjectMapper에 특수 문자 처리 기능 적용
         objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());

         // 4. MessageConverter에 ObjectMapper 설정
         MappingJackson2HttpMessageConverter htmlEscapingConverter =
                 new MappingJackson2HttpMessageConverter();
         htmlEscapingConverter.setObjectMapper(objectMapper);

         return htmlEscapingConverter;
     }
}
