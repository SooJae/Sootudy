package com.soo.sootudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.soo.sootudy.domain.BoardAttachVO;
import com.soo.sootudy.domain.BoardVO;
import com.soo.sootudy.domain.Criteria;

import com.soo.sootudy.mapper.BoardAttachMapper;
import com.soo.sootudy.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().isEmpty()) {
			return;
		}
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public BoardVO get(int bno, Criteria cri) {
		log.info("get......."+bno );
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify......" + board);

		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		
		  if (modifyResult && !board.getAttachList().isEmpty()) {
			  
		  board.getAttachList().forEach(attach -> {
		  
		  attach.setBno(board.getBno()); attachMapper.insert(attach); }); 
		  
		  }
		 

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
	
	

}
