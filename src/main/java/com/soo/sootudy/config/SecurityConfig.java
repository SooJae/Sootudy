package com.soo.sootudy.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.soo.sootudy.security.CustomUserDetailsService;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
public class SecurityConfig extends WebSecurityConfigurerAdapter {


	@Autowired
	private DataSource dataSource;
	
	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(customUserService())
			.passwordEncoder(passwordEncoder());
	}
	//
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
//
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//UTF-8로 인코딩 하기위해
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
		//
		
		http.authorizeRequests()
		.antMatchers("/sample/all").permitAll()
		.antMatchers("/sample/admin").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/sample/member").access("hasRole('ROLE_MEMBER')");
		
		http.formLogin()
		.loginPage("/customLogin")
		.loginProcessingUrl("/login");
		
		http.logout()
		.logoutUrl("/customLogout")
		.invalidateHttpSession(true)
		.deleteCookies("remember-me","JSESSION_ID");
		
		http.rememberMe()
			.key("SooJae")
			.tokenRepository(persistentTokenRepository())
			.tokenValiditySeconds(604800);
			
	}
//자동 로그인 설정
	private PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}

}
