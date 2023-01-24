package com.commu.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@GetMapping("/accessError")
    //Authentication 객체는 스프링 시큐리티에서 제공하는 사용자의 정보를 담고있는 객체다 (아이디, 권한 등)
    //필요한 경우 사용자의 정보를 화면에 보여주기 위해 파라미터로 받았다.
    public void accessDenied(Authentication auth, Model model){
    	//model에 접근이 제한됐다는 메시지를 담아 보낸다.
    	model.addAttribute("msg", "Access Denied");
    }
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "계정을 확인해 주세요");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
	}
	
}
