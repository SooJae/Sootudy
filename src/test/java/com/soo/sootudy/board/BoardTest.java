package com.soo.sootudy.board;

import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.soo.sootudy.config.RootConfig;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class BoardTest {
	@Autowired
	private BoardMapper mapper; 
	
	
	
	@Test @Ignore
	public void insertBoard() {
		IntStream.rangeClosed(1,253).forEach(i->{
			BoardVO vo = new BoardVO();
			vo.setBname("free");
			vo.setTitle(i+"  게시판제목입니다요 안녕하세요 ㅎㅎㅎㅎㅎ 어디까지 늘어날까요? 생략은 되는걸까요? 정말 궁금합니다요 ㅎㅎㅎㅎㅎㅎㅎ");
			vo.setContent("게시판내용입니"+i);
			vo.setWriter("이수재입니다"+i);
			mapper.insertSelectKey(vo);
		});
	}

}
