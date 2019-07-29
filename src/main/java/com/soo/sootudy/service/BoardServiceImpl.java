package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soo.sootudy.domain.BoardAttachVO;
import com.soo.sootudy.domain.BoardLikeVO;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;
import com.soo.sootudy.mapper.BoardAttachMapper;
import com.soo.sootudy.mapper.BoardLikeMapper;
import com.soo.sootudy.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Autowired
	private BoardLikeMapper likeMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
	}

	@Transactional
	@Override
	public BoardVO get(int bno, Criteria cri) {
		mapper.updateViewCnt(bno, 1);
		return mapper.read(bno);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		
		log.info("modify......"+board);
//		if(modifyResult && !board.getAttachList().isEmpty() ) {
		
		if (modifyResult && board.getAttachList().size()>0) {
			  log.info("안뇽"+board);
		  board.getAttachList().forEach(attach -> {
			  log.info("안뇽3"+board);
		  
		  attach.setBno(board.getBno()); 
		  attachMapper.insert(attach); 
		  }); 
		}
		 log.info("안뇽안뇽"+board);

		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(int bno) {
		log.info("remove...." +bno);
		
		attachMapper.deleteAll(bno);
		return mapper.delete(bno)==1;
	}


	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(int bno) {

		log.info("get Attach list by bno: "+ bno);
		return attachMapper.findByBno(bno);
	}

	@Override
	@Transactional
	public int like(BoardLikeVO vo) {
		if(likeMapper.read(vo)==null) {
			log.info("like: "+ vo);
			mapper.updateLikeCnt(vo.getBno(), 1);
			return likeMapper.create(vo);
		}else {
			log.info("dislike: "+ vo);
			mapper.updateLikeCnt(vo.getBno(), -1);
			return likeMapper.delete(vo);
		}
		
	}

	@Override
	public int getLikes(int bno) {
		log.info("get like: "+ bno);
		return likeMapper.getLikes(bno);
	}
	
	

}
