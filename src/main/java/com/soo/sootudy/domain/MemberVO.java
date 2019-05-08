package com.soo.sootudy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String nm;
	private String email;
	private String type; 
	private boolean flag;
	
	private Date dt;
	private Date udt_dt;
	private List<AuthVO> authList;
	
}
