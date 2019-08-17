package com.soo.sootudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soo.sootudy.domain.StudyTodoVO;

public interface StudyTodoMapper {

	public int insert(StudyTodoVO vo);

	public List<StudyTodoVO> getList(int sno);


	public void check(@Param("tdno") String tdno, @Param("achive") String achive);

}
