package com.soo.sootudy.service;

import java.util.Map;

import com.soo.sootudy.domain.MemberVO;

public interface MemberService {
	
		public void register(MemberVO vo);
		
		public MemberVO checkMember(Map<String,String> map);
		
		public MemberVO getMemberByID(String id);
		
}
