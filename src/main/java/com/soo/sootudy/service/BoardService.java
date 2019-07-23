package com.soo.sootudy.service;

import java.util.List;

import com.soo.sootudy.domain.BoardAttachVO;
import com.soo.sootudy.domain.BoardLikeVO;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(int bno, Criteria cri);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int bno);
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	 
	public List<BoardAttachVO> getAttachList(int bno);

	public int like(BoardLikeVO vo);



	public int getLikes(int bno);
}
