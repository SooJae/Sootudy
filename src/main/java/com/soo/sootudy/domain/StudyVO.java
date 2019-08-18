package com.soo.sootudy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class StudyVO {

	private int sno;
	private String title;
	private String content;
	private String leader;
	private Date dt;
	private Date udt_dt;
	private String delete_flag;
	private int cnt;
	private int cnt_max;
	
	private List<String> members;
}