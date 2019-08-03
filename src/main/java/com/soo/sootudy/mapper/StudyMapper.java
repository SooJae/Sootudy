package com.soo.sootudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyVO;

public interface StudyMapper {

	public List<StudyVO> getListWithPaging(@Param("scri") StudyCriteria scri) ;


	public int getTotal();


	public StudyVO read(int sno);

}