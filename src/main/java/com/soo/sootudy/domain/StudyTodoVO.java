package com.soo.sootudy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class StudyTodoVO {

	private int tdno;
	private String todo;
	private String leader;
	private Date reg_dt;
	private Date exp_dt;
	private String achive;
	
	private List<String> checks;
	
	private int sno;
}
