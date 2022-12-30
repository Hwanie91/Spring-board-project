package com.commu.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.commu.domain.BoardVO;
import com.commu.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	//@Test
	public void testGetList() {
		mapper.getList().forEach(board ->log.info(board));
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(15);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getBno()));
	}
	
	//@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 글");
		vo.setWriter("새로 작성하는 글");
		mapper.insert(vo);
	}
	
	//@Test
	public void testInsertLastId() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새 InsertLastId");
		vo.setContent("InsertLastId");
		vo.setWriter("user00");
		mapper.insertLastId(vo);
		log.info(vo);
	}
	
	//@Test
	public void testRead() {
		BoardVO vo = mapper.read(265L);
		log.info(vo);
		
	}
	
	//@Test
	public void testDelete() {
		mapper.delete(264);
	}
	
	//@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(247L);
		vo.setTitle("고쳐진 제목");
		vo.setContent("고쳐진 내용");
		vo.setWriter("고쳐진 작성자");
		
		int count = mapper.update(vo);
		log.info("update cnt : " + count);
	}
	
}
