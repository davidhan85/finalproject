package com.team5.finalTopic.controller.Activity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.Activity.ActRepository;
import com.team5.finalTopic.model.Activity.Activity;
import com.team5.finalTopic.model.Activity.MultiMember;
import com.team5.finalTopic.model.Activity.MultiMemberRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.Activity.ActServiceImpl;
import com.team5.finalTopic.service.Activity.MultiService;
import com.team5.finalTopic.service.Activity.SignupService;
import com.team5.finalTopic.service.member.MemberService;

@Controller
public class FrontActivityController {
	@Autowired
	private MemberRepository MR;

	@Autowired
	private SignupService signService;

	@Autowired
	private ActServiceImpl actService;

	@Autowired
	private ActRepository actRepository;

	@Autowired
	private MultiMemberRepository multiRepository;

	@Autowired
	private MultiService multiService;
	
	@Autowired
	private MemberService mberService;

//	@GetMapping("/activity")
//	public String getAllActivities(Model model) {
//		model.addAttribute("activities", actService.findAll());
//		return "Activity/search";
//	}

	@GetMapping("/activity") //要使用分頁，命名entity的時候，不要用底線命名，會出現問題。再搭配	<c:forEach items="${activities.content}" var="activity">
	public String getAllActivities(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<Activity> page = actService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		return "Activity/search";		
	}
	
//	//回傳前3筆資料
//		@ResponseBody
//		@PostMapping("/api/messages/post")
//		public Page<Messages> postMessageApi(@RequestBody Messages msg){
//			//	@RequestBody是將Java物件轉成JSON
//			mService.addMessage(msg);//新增
//			
//			Page<Messages> page = mService.findByPage(1);//第1頁，回傳前3筆資料
//			
//			return page;
//		}

	// 關鍵字查詢
	@GetMapping("/searching")
	public String showActivity(@RequestParam("keyword") String keyword, Model model) {
		String keyword1 = keyword.toString();
		List<Activity> ActivityBeans = actService.ActivitylistAll(keyword1);
		model.addAttribute("searchactivities", ActivityBeans);
		model.addAttribute("keyword", keyword);

		return "Activity/Id";

	}


	@PostMapping("/registration")//1.當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入，使用者會自己手動輸入
	public String MultiMember(Model model) {
		model.addAttribute("111", new MultiMember());
		return "Activity/Register";
	}


	
	@PostMapping("/store")//2.使用者按下再新增的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
	public String addMultiMember(  
			@ModelAttribute("111") MultiMember memberss, Model model)  {
		System.out.println("活動編號為"+memberss.getName());
		
		multiService.addForm(memberss);
		return "Activity/Choices";
//		return "redirect:/registration";
	}
	

	
	@GetMapping("/next")
	public String Next(@RequestParam("id") Integer id,Model model) {
//		@ModelAttribute("multiMember")
		System.out.println(id);
		List<MultiMember> multiMember = multiRepository.findDataByMemberNumber(id);
//		 Member member = mberService.findById(id);
//		 MultiMember multiMember=new MultiMember();
//		 multiMember.setMemberss(member);
		
		model.addAttribute("multis",multiMember);
		return "Activity/multiList";
	}


//	@GetMapping("/ButtonUpdate")
//	public String ButtonUpdateById(@RequestParam("activity_id")Integer activity_id,Model model) {
//		Activity msg = actService.findActivityByActivity_id(activity_id);
//		
//		model.addAttribute("messages",msg);
//		return "Activity/editPage";
//		
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("/ecpayCheckout")
	public String ecpayCheckout() {
		String aioCheckOutALLForm = signService.ecpayCheckout();
		
		return aioCheckOutALLForm;
	}
	
	
	

	public FrontActivityController() {
	}

}
