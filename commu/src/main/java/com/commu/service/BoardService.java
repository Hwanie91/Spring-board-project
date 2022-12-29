package com.commu.service;

import java.util.List;

import com.commu.domain.BoardVO;

public interface BoardService {
	
	public void register(BoardVO vo); // 등록
	public BoardVO get(Long bno); // 읽기
	public boolean modify(BoardVO vo); // 수정
	public boolean remove(Long bno); // 삭제
	public List<BoardVO> getList(); // 목록

}
