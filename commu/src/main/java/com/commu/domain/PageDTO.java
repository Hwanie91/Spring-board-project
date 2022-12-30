package com.commu.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO { // DTO : Data Transfer Object
	
	private int startPage; // 페이징 시작
	private int endPage;	// 1페이지라고 가정하면 endPage는 10
	private boolean prev, next; // 이전, 다음 버튼. 경우에 따라러 보이기
	private int total; // 총 게시물 수
	private Criteria cri; // 현재 페이지와 페이지당 게시물 수
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; 
		// Math.ceil은 소수점 이하를 올림함
		
		// 1페이지 라고 가정하면 endPage는 10
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
