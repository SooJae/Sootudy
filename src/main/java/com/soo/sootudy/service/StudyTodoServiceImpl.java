package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soo.sootudy.domain.StudyTodoVO;
import com.soo.sootudy.mapper.StudyTodoMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudyTodoServiceImpl implements StudyTodoService {

	@Autowired
	private StudyTodoMapper studyTodoMapper;


	@Transactional
	@Override
	public int register(StudyTodoVO vo) {
		log.info("register...." + vo);

		return studyTodoMapper.insert(vo);
	}


	@Override
	public List<StudyTodoVO> getTodoList(int sno) {
		return studyTodoMapper.getList(sno);
	}


	@Override
	public int check(StudyTodoVO vo) {
		// TODO Auto-generated method stub
		return studyTodoMapper.check(vo);
	}
	

//	@Override
//	public ReplyVO get(int rno) {
//		log.info("get....." + rno);
//		return studyTodoMapper.read(rno);
//	}
//
//	@Override
//	public int modify(ReplyVO vo) {
//		log.info("modify......." + vo);
//		return studyTodoMapper.update(vo);
//	}
//
//	@Transactional
//	@Override
//	public int remove(int rno) {
//		log.info("remove...." + rno);
//
//		ReplyVO vo = studyTodoMapper.read(rno);
//
//
//		return studyTodoMapper.delete(rno);
//	}
//
//	@Override
//	public List<ReplyVO> getList(Criteria cri, int bno) {
//		log.info("getList....." + bno);
//		return studyTodoMapper.getListWithPaging(cri, bno);
//	}
//
//	@Override
//	public ReplyPageDTO getListPage(Criteria cri, int bno) {
//
//		return new ReplyPageDTO(studyTodoMapper.getCountByBno(bno), studyTodoMapper.getListWithPaging(cri, bno));
//	}

}
