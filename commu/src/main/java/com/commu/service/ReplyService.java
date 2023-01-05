package com.commu.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.commu.domain.Criteria;
import com.commu.domain.ReplyPageDTO;
import com.commu.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int remove(Long rno);
	public int modify(ReplyVO vo);
	public List<ReplyVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListWithPaging(Criteria cri, Long bno);
}
