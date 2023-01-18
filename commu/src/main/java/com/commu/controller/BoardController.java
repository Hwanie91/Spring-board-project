package com.commu.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.commu.domain.BoardVO;
import com.commu.domain.Criteria;
import com.commu.domain.PageDTO;
import com.commu.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	private void list(Criteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		// 컨트롤러 -> 서비스 -> 매퍼 -> mybatis
	}
	
	// 글쓰기
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		// @Controller 어노테이션이 붙고, 컴포넌트 스캔에 패키지가 지정되어 있다면, 
		// 매개변수 인자들은 스프링이 자동으로 생성 할당 함.
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		// 리다이렉트 시키면서 1회용 값을 전달.
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		// 이동할 주소를 리턴하지 않으면, 요청한 이름으로의 jsp 파일을 찾음
	}
	
	// 글읽기
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) { 
		// @RequestParam : 요청 전달값으로 글번호 이용.
		// @ModelAttribute("cri") Criteria cri == model.addAttribute("cri", cri);
		log.info("/get or /modify");
		model.addAttribute("board", service.get(bno));
		
	}
	
	// 글 수정
	@PostMapping("/modify") // post 요청으로 /modify가 온다면, 아래 메소드 수행
	@PreAuthorize("principal.username==#board.writer")
	public String modify(BoardVO board, RedirectAttributes rttr, Criteria cri) {
		log.info("modify : " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		// 수정이 성공하면 success 메시지가 포함되어 이동, 실패하면 메세지 빼고 이동
		return "redirect:/board/list";
	}
	
	// 글 삭제
	@PostMapping("/remove")
	@PreAuthorize("principal.username==#board.writer")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, Criteria cri) {
		log.info("remove" + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
}
