package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.ReplyPageDTO;
import com.soo.sootudy.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(int rno);
	
	public int modify (ReplyVO vo);
	
	public int remove(int rno);
	
	public List<ReplyVO> getList(Criteria cri, int bno);
	
	public ReplyPageDTO getListPage(Criteria cri, int bno);
	
	//public int insertBoardReply (ReplyVO vo); 
}
