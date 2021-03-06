package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyMemberVO;
import com.soo.sootudy.domain.StudyVO;
import com.soo.sootudy.mapper.StudyMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyMapper studyMapper;

	@Override
	public List<StudyVO> getList(StudyCriteria scri) {
		// TODO Auto-generated method stub
		
		return studyMapper.getListWithPaging(scri);
	}

	@Override
	public StudyVO get(int sno, Criteria scri) {
		// TODO Auto-generated method stub
		return studyMapper.read(sno);
	}

	@Override
	public int getTotal(StudyCriteria scri) {
		// TODO Auto-generated method stub
		return studyMapper.getTotalCount(scri);
	}

	@Override
	public void register(StudyVO study) {
		studyMapper.updateMemberCnt(study.getSno(), 1);
		// TODO Auto-generated method stub
		studyMapper.insertSelectKey(study);
	}

//모임 가입
	@Transactional
	@Override
	public void joinStudy(StudyMemberVO vo) {
		// TODO Auto-generated method stub
		studyMapper.updateMemberCnt(vo.getSno(), 1);
		studyMapper.joinStudy(vo);
		
	}
	



}
