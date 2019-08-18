package com.soo.sootudy.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
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
public class RootConfig {

//	@Autowired
//	public GlobalPropertySource globalPropertySource;
	
	@Bean
	public DataSource dataSource() {
		HikariConfig hikariConfig = new HikariConfig();
//		spring.datasource.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
//				spring.datasource.url=jdbc:log4jdbc:mariadb://stddbinstance.c6v2froaotfn.ap-northeast-2.rds.amazonaws.com:3306/SOOTUDY
//				spring.datasource.username=SOOJAE
//				spring.datasource.password=suss1109!!
		
		hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		hikariConfig.setJdbcUrl("jdbc:log4jdbc:mariadb://stddbinstance.c6v2froaotfn.ap-northeast-2.rds.amazonaws.com:3306/SOOTUDY");
		 
		hikariConfig.setUsername("SOOJAE");
		hikariConfig.setPassword("suss1109!!");
		
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

