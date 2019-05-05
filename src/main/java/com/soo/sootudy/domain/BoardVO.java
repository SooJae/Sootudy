package com.soo.sootudy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String bname;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private Date updateDate;
	
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;

}
