package com.team5.finalTopic.controller.member;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.member.EmailService;
import com.team5.finalTopic.service.member.GlobalService;
import com.team5.finalTopic.service.member.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private MemberService memberService;


	private GlobalService globalService;

	@Autowired
	private EmailService emailService;


	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(value = "/memberlist")
	public String findAllMembers(Model model){
		List<Member> Allmember = memberService.findAll();
		model.addAttribute("member",Allmember);
		return "member/memberlists";

	}
//	@GetMapping("/findmember/{m_number}")
//	public 	Optional<Member> findByID(@PathVariable("m_number") Integer m_number ){
//		Optional<Member> byId = memberRepository.findById(m_number);
//		return byId;
//
//	}


	@GetMapping(value = "/newmember")
	public String showNewMemberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/newmember";
	}

	@PostMapping(value = "/messages/newmember")
	@ResponseBody
	public RedirectView addMember(@RequestBody @Validated @ModelAttribute("member")Member member, BindingResult result){

		if (result.hasErrors()){
			return new RedirectView("/finalTopic_5/member/newmember");
		}else {
			boolean isInsert = (member.getM_number() == null); //判斷是否為insert
//
//			String encryptPwd = encryptString(member.getM_password());
//			System.out.println(encryptPwd);
//			member.setM_password(encryptPwd);
			//產生token
			String Token= UUID.randomUUID().toString();
			member.setM_verify(Token);
			System.out.println(Token);
			//發送驗證信件
			String confirmationUrl="http://localhost:8079/finalTopic_5/confirm?email="+member.getM_email()+"&token="+Token;
			emailService.sendRegistrationConfirmationEmail(member,confirmationUrl);
			
			Member member1 = memberService.savePictureInDB(member, isInsert);// 取得MultipartFile，把圖片以byte[]型態塞進DB

			memberService.save(member1);
		}
		
		return new RedirectView("/finalTopic_5/Login");
	}

//	@PostMapping("/sendmail")
//	@ResponseBody
//	public String sendVerificationEmail(@RequestBody Member member){
//		//產生token
//		String Token= UUID.randomUUID().toString();
//		member.setM_verify(Token);
//		System.out.println(Token);
//		//發送驗證信件
//		String confirmationUrl="http://localhost:8079/finalTopic_5/confirm?email="+member.getM_email()+"&token="+Token;
//		emailService.sendRegistrationConfirmationEmail(member,confirmationUrl);
//
//		return "發送成功";
//	}
	//驗證 註冊驗證信的email和token是否一致
	@GetMapping("/confirm")
	public String confirmRegistration(@RequestParam("email") String email, @RequestParam("token") String token) {
		Member member = memberRepository.findByM_email(email);
		if (member != null && member.getM_verify().equals(token)) {
			member.setM_status("success");
			memberRepository.save(member);
			return "redirect:/Login";
		} else {
			return "/index";
		}
//		return  null;
	}

	@DeleteMapping(value = "/deletemember/{m_number}")
	public String deleteMember(@PathVariable Integer m_number){
		memberRepository.deleteById(m_number);
		return "redirect:/memberlist";
	}


	@GetMapping(value = "/updatememberform/{m_number}")
	public String showUpdateMemberForm(@PathVariable("m_number") Integer m_number,Model model) {
		Optional<Member> byId = memberRepository.findById(m_number);
		model.addAttribute("member", byId);
		return "member/updatemember";
	}

	@PutMapping (value = "/updatemember/{m_number}")
	public String updateMember(@PathVariable Integer m_number , Member member){
		boolean isInsert = (member.getM_number() != null); //判斷是否為insert
		Member member1 = memberService.savePictureInDB(member, isInsert);// 取得MultipartFile，把圖片以byte[]型態塞進DB
		member1.setM_number(m_number);
		memberService.save(member1);
		return "redirect:/memberlist";
	}
	
	@GetMapping("/existsAccount")
	@ResponseBody
	public ResponseEntity<?> existsAccount(@RequestBody @RequestParam("account") String account ){
		
		Boolean existsaccount=memberService.existsByM_account(account);
		System.out.println(existsaccount);
		if(existsaccount) {
			return ResponseEntity.status(HttpStatus.OK).body("此帳號已有人使用");
		}else {
			return ResponseEntity.status(HttpStatus.OK).body("此帳號可以使用");
		}
				
	}

	@GetMapping(value = "/memberlist/{m_number}")
	public ResponseEntity<byte[]> getImage(@PathVariable("m_number") Integer m_number) {
		byte[] imageBytes = memberService.getMemberImage(m_number);
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	}

	@GetMapping(value = "/memberimage")
	public ResponseEntity<byte[]> getCenterImage(HttpServletRequest request ) {
		Member memberbean = (Member) request.getSession().getAttribute("memberbean");
		byte[] imageBytes = memberService.getMemberImage(memberbean.getM_number());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	}

	public MemberController() {

	}

}
