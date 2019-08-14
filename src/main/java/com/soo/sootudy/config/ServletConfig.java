package com.soo.sootudy.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

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
	
	// xss 공격 방지
//	@Override
//	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//		converters.add(escapingConverter());
//		super.addDefaultHttpMessageConverters(converters);  // default Http Message Converter  추가
//	}
//	
//	 private HttpMessageConverter<?> escapingConverter() {
//         ObjectMapper objectMapper = new ObjectMapper();
//         // 3. ObjectMapper에 특수 문자 처리 기능 적용
//         objectMapper.getFactory().setCharacterEscapes(new HTMLCharacterEscapes());
//
//         // 4. MessageConverter에 ObjectMapper 설정
//         MappingJackson2HttpMessageConverter htmlEscapingConverter =
//                 new MappingJackson2HttpMessageConverter();
//         htmlEscapingConverter.setObjectMapper(objectMapper);
//
//         return htmlEscapingConverter;
//     }

}