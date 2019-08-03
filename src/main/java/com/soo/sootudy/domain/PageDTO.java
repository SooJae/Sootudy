package com.soo.sootudy.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@ToString
@Slf4j
public class PageDTO{
 
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total; //전체 데이터의 수 
	private Criteria cri;
	
	
	private int displayPageNum = 5;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total; //311개라고 할때
		this.endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum)) * displayPageNum; //1,2,3,4,5를 해도 5만 나옴 6부터 10이나옴 11부터 15나옴
		this.startPage = (this.endPage -displayPageNum) +1; //5-5를하면 0이나옴 +1을 하니까 1페이지가 나옴 10(위에서 5다음 10이되므로)-5는 5이고 +1 하면 6
		int realEnd = (int) (Math.ceil(total / (double) cri.getPerPageNum())); // 맨 끝 구함 (올림(총 갯수 311개 / 페이지당 30개)) = 11개
		if(realEnd < this.endPage) { // 5,10 일때는 실행이 안됨 < 11
			this.endPage = realEnd;	// 15개 = 11개
		}
		this.prev = this.startPage > 1; //start가 1보다클시 ( 사실상 5보다 클시라고 생각하면 된다. 첫페이지는 1이고 1다음은 6이므로) this.displayPageNum로 써도 된다.
		this.next = this.endPage * cri.getPerPageNum() < total;  // 5,10,11*30 < 311 (사실상 마지막페이지 빼고 다 가능하다)
	}
	
}
