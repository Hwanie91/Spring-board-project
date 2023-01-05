package com.commu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "계정을 확인해 주세요");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
	}
	
}
