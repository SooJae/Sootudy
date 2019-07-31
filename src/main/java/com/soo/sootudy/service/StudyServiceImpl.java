package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.soo.sootudy.controller.StudyService;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyVO;
import com.soo.sootudy.mapper.StudyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@Service
@Slf4j
@AllArgsConstructor
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyMapper studyMapper;
	
	@Override
	public List<StudyVO> getList(StudyCriteria scri) {
		
		log.info("get List on study"+ scri);
		return studyMapper.getListWithPaging();
	}

	@Override
	public int getTotal(StudyCriteria scri) {
		log.info("get Total on study"+scri);
		return studyMapper.getTotalCount();
	}

}
