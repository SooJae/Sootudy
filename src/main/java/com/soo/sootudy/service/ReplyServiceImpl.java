package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.ReplyPageDTO;
import com.soo.sootudy.domain.ReplyVO;

import com.soo.sootudy.mapper.BoardMapper;
import com.soo.sootudy.mapper.ReplyMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register...." + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) {
		log.info("get....." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify......." + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(int rno) {
		log.info("remove...." + rno);

		ReplyVO vo = mapper.read(rno);

		boardMapper.updateReplyCnt(vo.getBno(), -1);

		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		log.info("getList....." + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int bno) {

		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
