package com.soo.sootudy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int rno;
	private int bno;
	
	private String replyText;
	private String replyer;
	private Date replyDate;
	private Date replyudt_dt;
	
}
