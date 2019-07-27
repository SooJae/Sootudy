package com.soo.sootudy.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date dt;
	private Date udt_dt;
	private String delete_flag;
	private int v_cnt;
	private int reply_cnt;
	private int like_cnt;
	
	private List<BoardAttachVO> attachList;

}
