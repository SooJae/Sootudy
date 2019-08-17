package com.soo.sootudy.mapper;

import java.util.List;

import com.soo.sootudy.domain.StudyTodoVO;

public interface StudyTodoMapper {

	public int insert(StudyTodoVO vo);

	public List<StudyTodoVO> getList(int sno);

	public void check(String tdno, String achive);

}
