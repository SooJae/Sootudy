package com.soo.sootudy.mapper;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.soo.sootudy.config.RootConfig;
import com.soo.sootudy.domain.MemberVO;

import lombok.extern.log4j.Log4j;
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class MemberMapperTests {
	
	@Autowired
	MemberMapper mapper;
	
	@Test
	public void checkTest() {
		Map<String, String>  map = new HashMap<>();
		
		log.info(mapper.get("email","checkArg"));
	}
	
	@Test @Ignore
	public void insertMember() {
		IntStream.range(1,30).forEach(i->{
			MemberVO vo =new MemberVO();
			vo.setId("dltn"+i);
			vo.setNm("메롱"+i);
			vo.setPw("abcd");
			vo.setEmail("abcd@dddd"+i);
			mapper.insert(vo);
			}
		);
	}
}
