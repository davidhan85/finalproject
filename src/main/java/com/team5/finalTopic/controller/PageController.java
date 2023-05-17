package com.team5.finalTopic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.member.MemberService;

@Controller
public class PageController {
	
	@Autowired
	public MemberService memberService;

	
	@GetMapping("/")
	public String home(HttpSession session) {
		Member member=(Member) session.getAttribute("memberbean");
		if(member!=null) {
			Member updatedMember=memberService.findById(member.getM_number());
			session.setAttribute("memberbean", updatedMember);
		}
		return "mall/mall";

	}
	@GetMapping("/home")
	public String index(HttpSession session) {
		Member attribute = (Member) session.getAttribute("memberbean");
		if(attribute!=null) {
			return "mall/mall";
		}else {
			return "redirect:/Login";
		}
		
		
		
	}

}
