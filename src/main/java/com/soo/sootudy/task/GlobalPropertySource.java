package com.soo.sootudy.task;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.stereotype.Component;

import lombok.Getter;

@Component
@PropertySources({
	@PropertySource( value = "classpath:/application.properties", ignoreResourceNotFound = true ),
//	window
    @PropertySource( value = "file:c:/dev/config.properties", ignoreResourceNotFound = true ),
// linux
    @PropertySource( value = "file:${catalina.home}/config/application.properties", ignoreResourceNotFound = true)
})
@Getter
public class GlobalPropertySource {
  
	
    @Value("${spring.aws.datasource.driverClassName}")
    private String driverClassName;
    
    @Value("${spring.aws.datasource.url}")
    private String url;
    
    @Value("${spring.aws.datasource.username}")
    private String username;
     
    @Value("${spring.aws.datasource.password}")
    private String password;
    
    @Value("${spring.aws.credentials.accessKey}")
    private String accessKey;
    
    @Value("${spring.aws.credentials.secretKey}")
    private String secretKey;
    
//    @Value("${spring.aws.region}")
//    private String region;
    
    @Value("${spring.aws.s3.bucketName}")
    private String bucketName;
    

}

