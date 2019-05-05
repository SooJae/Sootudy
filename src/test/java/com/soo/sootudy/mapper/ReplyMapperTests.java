package com.soo.sootudy.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.soo.sootudy.config.RootConfig;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.ReplyVO;
import com.soo.sootudy.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class ReplyMapperTests {

	private int[] bnoArr = {440, 438, 437};
	@Autowired
	private ReplyMapper mapper;
	
	@Test @Ignore
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1,600).forEach(i->{
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i%3]);
			vo.setReplyText("댓글 테스트10" + i);
			vo.setReplyer("replyer"+i);
			mapper.insert(vo);
		});
	}
	@Test @Ignore
	public void testRead() {
		int targetRno = 5;
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
	}
	@Test @Ignore
	public void testDelete() {
		int target = 5;
		 mapper.delete(target);
	}
	
	@Test @Ignore
	public void testlist() {
		ReplyVO vo = mapper.list();
		log.info(vo);
	}
	@Test @Ignore
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setReplyText("안녕하세요 업뎃했어용");
		int count = mapper.update(vo);
		log.info("안녕"+count);
	}
	@Test @Ignore
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(i->log.info(i));
	}
	
	@Test @Ignore
	public void testList2() {
		/*
		 * Criteria cri = new Criteria(1,10);
		 */		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 437);
		
		replies.forEach(reply -> log.info(reply));
	}
	
}
