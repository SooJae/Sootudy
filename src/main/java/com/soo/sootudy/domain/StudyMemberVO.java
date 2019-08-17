package com.soo.sootudy.domain;

import java.util.Date;

import lombok.Data;
@Data
public class StudyMemberVO {
	private int sno;
	private String member_id;
	private String member_nm;
	private Date reg_dt;
	
}
