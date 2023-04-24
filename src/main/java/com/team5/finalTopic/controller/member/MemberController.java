package com.team5.finalTopic.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.member.MemberService;

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

		Member member1 = memberService.savePictureInDB(member, isInsert);// 取得MultipartFile，把圖片以byte[]型態塞進DB

		memberService.save(member1);

		return "redirect:/memberlist";
	}
	
	@GetMapping(value = "/updatemember")
	public String showUpdateMemberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/updatemember";
	}
	
	@PostMapping(value = "/updatemember/{m_number}")
	public String updateMember(@PathVariable("m_number")Integer m_number, @ModelAttribute Member member){

		boolean isInsert = (member.getM_number() == null); //判斷是否為insert
		Member member1 = memberService.savePictureInDB(member, isInsert);// 取得MultipartFile，把圖片以byte[]型態塞進DB
		memberService.save(member1);
		return "redirect:/memberlist";
	}
	
	
	
	@GetMapping(value = "/memberlist/{m_number}")
	public ResponseEntity<byte[]> getImage(@PathVariable("m_number") Integer m_number) {
		byte[] imageBytes = memberService.getMemberImage(m_number);
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);		
	}	
	public MemberController() {

	}

}
