package com.commu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.commu.domain.BoardVO;
import com.commu.domain.Criteria;
import com.commu.domain.ReplyVO;
import com.commu.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor // 모든 매개변수에 대한 생성자 생성(생성자 여러개 아님)
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Transactional
	@Override
	public void register(BoardVO Board) {
		log.info("register..." + Board);
		mapper.insertLastId(Board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get..." + bno);
		mapper.updateHit(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO Board) {
		log.info("modify..." + Board);
		return mapper.update(Board) == 1;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getListWithPaging..." + cri);
		// 페이징 조건대로 추출
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}



	
	

}
