package com.soo.sootudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(int rno);
	public int delete(int rno);
	public int update(ReplyVO vo);
	public ReplyVO list();
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") int bno
			);
	
	public int getCountByBno(int bno);
	/*
	 * public ReplyVO selectBoard6ReplyParent(String replyParent); public void
	 * updateBoard6ReplyOrder(ReplyVO replyInfo); public Integer
	 * selectBoard6ReplyMaxOrder(int bno); public int insertBoard6Reply(ReplyVO vo);
	 */
}
