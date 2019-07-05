package com.soo.sootudy.security.direct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.soo.sootudy.domain.MemberVO;
import com.soo.sootudy.security.domain.CustomUser;

import com.soo.sootudy.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {

		log.warn("아이디 : " + userid);

		// userName means id
		MemberVO vo = memberMapper.read(userid);

		log.warn("멤버 정보 가져오기 " + vo);

		return vo == null ? null : new CustomUser(vo);
	} 

}
