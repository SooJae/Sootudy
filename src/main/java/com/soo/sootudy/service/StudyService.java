package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyPageDTO;
import com.soo.sootudy.domain.StudyVO;

public interface StudyService {

	public StudyPageDTO getListPage(StudyCriteria scri);

	public List<StudyVO> getList(StudyCriteria scri);
	
//	public int getTotal(StudyCriteria scri);

	
}
