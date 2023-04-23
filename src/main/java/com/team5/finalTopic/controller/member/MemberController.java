package com.team5.finalTopic.controller.member;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private MemberService memberService;


	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(value = "/memberlist")
	public String findAllMembers(Model model){
		List<Member> Allmember = memberService.findAll();
		model.addAttribute("member",Allmember);
		return "member/memberlists";

	}
	@GetMapping(value = "/newmember")
	public String showNewMemberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/newmember";
	}
	@PostMapping(value = "/messages/newmember")
	public String addMember(@ModelAttribute("member")Member member){

		boolean isInsert = (member.getM_number() == null); //判斷是否為insert

		Member member1 = memberService.savePictureInDB(member, isInsert);// 取得MultipartFile，把圖片以BLOB型態塞進DB

		memberService.save(member1);

		return "redirect:/memberlist";
	}


	
	public MemberController() {

	}

}
