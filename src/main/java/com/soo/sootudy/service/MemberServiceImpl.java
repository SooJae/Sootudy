package com.soo.sootudy.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soo.sootudy.domain.MemberVO;
import com.soo.sootudy.mapper.MemberAuthMapper;
import com.soo.sootudy.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private MemberAuthMapper authmapper;
	
	@Override
	@Transactional
	public void register(MemberVO vo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id",vo.getId());
		map.put("auth","member");
		mapper.insert(vo);
		authmapper.insert(map);
		
		
	}
	@Override
	public MemberVO checkMember(Map<String,String> map) {
		return mapper.check(map);
		
	}
	@Override
	public MemberVO getMemberByID(String id) {
		return null;
	}
}
