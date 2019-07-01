package com.soo.sootudy.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soo.sootudy.domain.MemberVO;
import com.soo.sootudy.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
//	@Autowired
//	private MemberAuthMapper authmapper;
	
	@Override
	public void register(MemberVO vo) {
		mapper.insert(vo);
		
		
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
