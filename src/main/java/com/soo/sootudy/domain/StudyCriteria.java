package com.soo.sootudy.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class StudyCriteria {
	
	private int page;
	private int perPageNum;
	private String filter_mode;

	public StudyCriteria() {
		this(1,10);
	}
	
	public StudyCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	public StudyCriteria(int page, int perPageNum, String filter_mode) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.filter_mode = filter_mode;
	}

	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}

	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", this.page)
				.queryParam("perPageNum", this.perPageNum)
				.queryParam("filter_mode", this.filter_mode);
		return builder.toUriString();
	}
}
