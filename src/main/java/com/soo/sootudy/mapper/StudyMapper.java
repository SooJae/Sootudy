package com.soo.sootudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyMemberVO;
import com.soo.sootudy.domain.StudyVO;

public interface StudyMapper {

	public List<StudyVO> getListWithPaging(@Param("scri") StudyCriteria scri) ;

	public int getTotalCount(StudyCriteria scri);
	
	public StudyVO read(int sno);
	
	public void insertSelectKey(StudyVO study);

	public void joinStudy(StudyMemberVO vo);

}
