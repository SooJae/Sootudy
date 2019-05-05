package com.soo.sootudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(@Param("bno") int bno, @Param("bname") String bname);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
}
