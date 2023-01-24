package com.commu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sample/*")
@Controller
public class SampleController {
	
	@GetMapping("/all")
	public void doAll() {
		System.out.println("모든 사람 접근 가능");
		
	}
	
	@GetMapping("/member")
	public void doMember() {
		System.out.println("member 만 접근 가능");
	}
	
	@GetMapping("/admin") 
	public void doAdmin() {
		System.out.println("admin 만 접근 가능");
	}

}
