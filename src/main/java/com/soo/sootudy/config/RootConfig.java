package com.soo.sootudy.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.slf4j.Slf4j;

@Configuration
@ComponentScan(basePackages= {"com.soo.sootudy.service", "com.soo.sootudy.controller","com.soo.sootudy.aop","com.soo.sootudy.task"})
//@ComponentScan(basePackages= {"com.soo.sootudy.service", "com.soo.sootudy.controller","com.soo.sootudy.aop","com.soo.sootudy.task"},
//				excludeFilters = {
//						@Filter(type=FilterType.ASPECTJ, pattern="com.soo.sootudy.*.Study*")
//				}
//)

@EnableAspectJAutoProxy
@EnableScheduling
@EnableTransactionManagement

@MapperScan(basePackages = {"com.soo.sootudy.mapper"})
@Slf4j
@PropertySources({
	@PropertySource( value = "classpath:/application.properties", ignoreResourceNotFound = true ),
//	window
    @PropertySource( value = "file:c:/dev/config.properties", ignoreResourceNotFound = true ),
// linux 
    @PropertySource( value = "file:${catalina.home}/property/application.properties", ignoreResourceNotFound = true)
})
public class RootConfig {
	
	@Value("${spring.aws.datasource.driverClassName}")
    private String driverClassName;
    
    @Value("${spring.aws.datasource.url}")
    private String url;
    
    @Value("${spring.aws.datasource.username}")
    private String username;
     
    @Value("${spring.aws.datasource.password}")
    private String password;

	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();

//		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
//		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mariadb://stddbinstance.c6v2froaotfn.ap-northeast-2.rds.amazonaws.com:3306/SOOTUDY");
//		
//		hikariConfig.setUsername("SOOJAE");
//		hikariConfig.setPassword("suss1109!!");
		hikariConfig.setDriverClassName(driverClassName);
		hikariConfig.setJdbcUrl(url);
		 
		hikariConfig.setUsername(username);
		hikariConfig.setPassword(password);
		
		return new HikariDataSource(hikariConfig);
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		return sqlSessionFactory.getObject();
	}
	@Bean
	public DataSourceTransactionManager txManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
}

