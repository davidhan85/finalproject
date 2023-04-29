package com.team5.finalTopic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team5.finalTopic.model.member.Member;

@Controller
public class PageController {

	@GetMapping("/")
	public String home() {

		return "index";

	}
	@GetMapping("/home")
	public String index(HttpSession session) {
		Member attribute = (Member) session.getAttribute("memberbean");
		if(attribute!=null) {
			return "/index";
		}else {
			return "redirect:/Login";
		}
		
		
		
	}

}
