package com.commu.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.commu.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired}) // 어노테이션에 전달값이 여러개의 배열 형태라면 {}이용
	private BoardService service;
	
	@Test
	public void testResgister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("Git");
		vo.setContent("Github");
		vo.setWriter("Hwan");
		
		service.register(vo);
		log.info("생성된 게시물 번호 : " + vo.getBno());
		// 서비스 -> 매퍼 -> mybatis query, 다른 메소드 테스트는 비슷함
	}
}
