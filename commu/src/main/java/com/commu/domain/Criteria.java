package com.commu.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // Criteria : 페이징 처리 기준을 갖는 벨류 오브젝트
	
	private int pageNum; // 현재 페이지 번호
	private int amount; // 페이지당 게시물 수
	
	public Criteria() {
		this(1, 15); // 아래쪽에 전달해 줄 파라미터값 2개 생성자 호출
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getSkip() {
		return (this.pageNum - 1) * this.amount;
	}
	
}
