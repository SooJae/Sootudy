package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.StudyCriteria;
import com.soo.sootudy.domain.StudyMemberVO;
import com.soo.sootudy.domain.StudyTodoVO;
import com.soo.sootudy.domain.StudyVO;

public interface StudyService {


	public List<StudyVO> getList(StudyCriteria scri);

	public StudyVO get(int sno, Criteria scri);

	public int getTotal(StudyCriteria scri);

	public void register(StudyVO study);



	void joinStudy(StudyMemberVO vo);
	

//	public int changeCnt(ChatVO vo);
	
}
