package com.soo.sootudy.controller;

import java.util.List;

import com.soo.sootudy.domain.StudyCriteria;

public interface StudyService {

	public List<StudyVO> getList(StudyCriteria scri);

	public int getTotal(StudyCriteria scri);

	
}
