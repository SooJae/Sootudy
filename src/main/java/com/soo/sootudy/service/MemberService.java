package com.soo.sootudy.service;

import java.util.Map;

import com.soo.sootudy.domain.MemberVO;

public interface MemberService {
		public void register(MemberVO vo);
		
		public MemberVO read(Map<String,String> map);
}
