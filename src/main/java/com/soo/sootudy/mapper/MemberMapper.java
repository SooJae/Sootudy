package com.soo.sootudy.mapper;

import java.util.Map;

import com.soo.sootudy.domain.MemberVO;

public interface MemberMapper {
	
	public void insert(MemberVO vo);
	
	public MemberVO read(String username);
	

	public MemberVO check(Map<String, String> map);
	
}
