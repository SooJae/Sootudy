package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.domain.StudyVO;
import com.soo.sootudy.mapper.StudyMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyMapper studyMapper;
	
	@Override
	public StudyPageDTO getListPage(StudyCriteria scri) {
		log.info("getListPage.."+scri);
		return new StudyPageDTO(studyMapper.getTotal(), studyMapper.getListWithPaging(scri));
	}

	@Override
	public List<StudyVO> getList(StudyCriteria scri) {
		log.info("getList"+scri);
		return studyMapper.getListWithPaging(scri);
	}

	@Override
	public StudyVO get(int sno, Criteria scri) {
		return studyMapper.read(sno);
	}

	@Override
	public int getTotal(StudyCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	


}
