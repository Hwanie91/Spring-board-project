package com.commu.mapper;

import java.util.List;

import com.commu.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO vo);
	
	public long insertLastId(BoardVO vo);
	
	public BoardVO read(long bno);
	
	public int delete(long bno);
	
	public int update(BoardVO vo);

}
