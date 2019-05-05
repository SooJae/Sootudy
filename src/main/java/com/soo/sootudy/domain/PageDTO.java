package com.soo.sootudy.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@Slf4j
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total; //전체 데이터의 수 
	private Criteria cri;
	
	private int displayPageNum = 5;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		// total 119, pageNum 11
		this.endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum)) * displayPageNum;
		// pageNum 11, endpage = 11
		this.startPage = (this.endPage -displayPageNum) +1;
		//startPage 11
		int realEnd = (int) (Math.ceil(total / (double) cri.getPerPageNum()));
		//119* 1.0/ 10
		//realEnd = (int)11.9
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// endPage 11
		this.prev = this.startPage > 1;
		this.next = this.endPage * cri.getPerPageNum() < total;
	}
	
}
