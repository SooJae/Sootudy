package com.soo.sootudy.mapper;

import com.soo.sootudy.domain.BoardLikeVO;

public interface BoardLikeMapper {

	public int create(BoardLikeVO vo);
	
	public int delete(BoardLikeVO vo);
	
	public BoardLikeVO read(BoardLikeVO vo);


	public int getLikes(int bno);
}
