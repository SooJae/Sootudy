package com.soo.sootudy.task;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

import lombok.Getter;

@Configuration
@PropertySources({
//    @PropertySource( value = "file:c:/dev/config.properties", ignoreResourceNotFound = true ),
    @PropertySource( value = "file:${catalina.home}/config/application.properties", ignoreResourceNotFound = true)
})
@Getter
public class GlobalPropertySource {
  
	
    @Value("${spring.datasource.driverClassName}")
    private String driverClassName;
    
    @Value("${spring.datasource.url}")
    private String url;
    
    @Value("${spring.datasource.username}")
    private String username;
     
    @Value("${spring.datasource.password}")
    private String password;
 
}

