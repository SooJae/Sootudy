package com.soo.sootudy.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Override
	@Transactional
	public void register(MemberVO vo) {
		
		vo.setPw(pwEncoder.encode(vo.getPw()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",vo.getId());
		map.put("auth","MEMBER");
		mapper.insert(vo);
		authmapper.insert(map);
		
		
	}
	@Override
	public MemberVO checkMember(Map<String,String> map) {
		return mapper.check(map);
		
	}
}
