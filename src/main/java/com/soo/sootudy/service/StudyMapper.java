package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.controller.StudyVO;

public interface StudyMapper {

	public List<StudyVO> getListWithPaging() ;

	public int getTotalCount();

}
