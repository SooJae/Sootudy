package com.soo.sootudy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.soo.sootudy.auth.SnsValue;

@EnableWebMvc
@ComponentScan(basePackages = {"com.soo.sootudy.controller"})
@EnableGlobalMethodSecurity(prePostEnabled=true, securedEnabled=true)
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
	
//oauth2 login	
	@Bean
	public SnsValue naverSns() {
		final String naverClient ="ZJ5l9L2gV_43FWUaqynF";
		final String naverClientSecret ="ZPPj8kHPvp";
		final String naverRedirectUrl = "http://www.sootudy.com/auth/naver/callback";
				
		return new SnsValue("naver", naverClient, naverClientSecret, naverRedirectUrl);
	}
	
	@Bean
	public SnsValue googleSns() {
		final String googleClient ="817946037393-8raendl24chjdk5af2b33trlvup0v2gt.apps.googleusercontent.com";
		final String googleClientSecret ="O-7Xmkfs1zAMi1TPomR8E9cK";
		final String googleRedirectUrl = "http://www.sootudy.com/auth/google/callback";
		
		return new SnsValue("google", googleClient, googleClientSecret, googleRedirectUrl);
	}
	
	@Bean 
	OAuth2Parameters googleOAuth2Parameters(){
		googleOAuth2Parameters().setScope("https://www.googleapis.com/auth/userinfo.email");
		googleOAuth2Parameters().setRedirectUri("http://www.sootudy.com/auth/google/callback");
		return new OAuth2Parameters();
	}

}