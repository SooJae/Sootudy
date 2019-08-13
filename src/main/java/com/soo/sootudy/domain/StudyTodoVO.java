package com.soo.sootudy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StudyTodoVO {

	private int tdno;
	private String todo;
	private String leader;
	private Date reg_dt;
	private Date exp_dt;
	private String achive;
	
	private int sno;
}
