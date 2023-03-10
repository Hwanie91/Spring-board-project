package com.commu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.commu.domain.BoardVO;
import com.commu.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO vo);
	
	public long insertLastId(BoardVO vo);
	
	public BoardVO read(long bno);
	
	public void updateHit(long bno);
	
	public int delete(long bno);
	
	public int update(BoardVO vo);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount); 

}
