package com.team5.finalTopic.controller.member;

import com.team5.finalTopic.model.member.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository msService;
	@GetMapping("/Member/add")
	public String addMember(){


		return null;
	}
	
	public MemberController() {
		// TODO Auto-generated constructor stub
	}

}
