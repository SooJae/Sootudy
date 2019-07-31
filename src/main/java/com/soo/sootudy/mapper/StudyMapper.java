package com.soo.sootudy.mapper;

import java.util.List;

import com.soo.sootudy.domain.StudyVO;

public interface StudyMapper {

	public List<StudyVO> getListWithPaging() ;

	public int getTotalCount();

}
