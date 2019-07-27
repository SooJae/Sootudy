package com.soo.sootudy.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

/*@Getter
@Setter
@ToString*/
@Slf4j
@Data
public class Criteria {
	private int page;
	private int perPageNum;
	private String filter_mode;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,30);
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	public Criteria(int page, int perPageNum, String filter_mode) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.filter_mode = filter_mode;
	}
	
//	public Criteria(int page, int perPageNum, String bname) {
//		this.page = page;
//		this.perPageNum = perPageNum;
//		this.bname = bname;
//	}
	
	
	public int getPageStart() { 
		return(this.page -1) * perPageNum; 
	}
	
	/*getTypeArr은 검색 조건이 각 글자(T, W, C)로 구성되어 있으므로 검색조건을 배열로
	 만들어서 한번에 처리 MyBatis의 동적 태그를 활용할 수 있다.*/
	public String[] getTypeArr() {
		log.info("type"+type);
		return type == null? new String[] {}: type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", this.page)
				.queryParam("perPageNum", this.perPageNum)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword)
				.queryParam("filter_mode", this.filter_mode);
		
		return builder.toUriString();
	}
	 
	 
}
