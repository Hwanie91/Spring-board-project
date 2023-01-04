package com.commu.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter // Getter 위치 중요 : 초기화 이후 호출해야 한다. 생략하면 호출하고 초기화 하여 오류가 발생
public class ReplyPageDTO {
	
	private int replyTotalCnt; // 게시물의 댓글 총 갯수
	private List<ReplyVO> list; // 댓글의 목록
	
}
