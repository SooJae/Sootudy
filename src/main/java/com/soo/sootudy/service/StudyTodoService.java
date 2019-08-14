package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.StudyTodoVO;

public interface StudyTodoService {

	public int register(StudyTodoVO vo);

	public List<StudyTodoVO> getTodoList(int sno);

	public int check(StudyTodoVO vo);


}
