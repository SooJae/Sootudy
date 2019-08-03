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
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("아이디 : " + username);

		// userName means id
		MemberVO vo = memberMapper.read(username);

		log.warn("멤버 정보 가져오기 " + vo);

		if(vo == null) {
			throw new UsernameNotFoundException("아이디 또는 비밀번호가 틀립니다.");
		}
		else {
			return new CustomUser(vo);
		}
//		return vo == null ? null : new CustomUser(vo);
	} 

}
