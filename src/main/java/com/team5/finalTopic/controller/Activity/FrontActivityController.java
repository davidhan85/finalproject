package com.team5.finalTopic.controller.Activity;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.model.Activity.ActRepository;
import com.team5.finalTopic.model.Activity.Activity;
import com.team5.finalTopic.model.Activity.MultiMember;
import com.team5.finalTopic.model.Activity.MultiMemberRepository;

import com.team5.finalTopic.model.cs.CustomerComplaints;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.Activity.ActService;
import com.team5.finalTopic.service.Activity.ActServiceImpl;
import com.team5.finalTopic.service.Activity.MultiService;
import com.team5.finalTopic.model.Activity.SignUp;

@Controller
public class FrontActivityController {

	@Autowired
	private ActServiceImpl actService;
	
	@Autowired
	private ActRepository actRepository;
	
	@Autowired
	private MultiMemberRepository multiRepository;
	
	@Autowired
	private MultiService multiService;
	
	@GetMapping("/activity")
	public String getAllActivities(Model model) {
		model.addAttribute("activities", actService.findAll());
		return "Activity/search";
	}

	// 關鍵字查詢
	@GetMapping("/searching")
	public String showActivity(@RequestParam("keyword") String keyword,Model model) {
		String keyword1 = keyword.toString();
		List<Activity> ActivityBeans = actService.ActivitylistAll(keyword1);
		model.addAttribute("searchactivities", ActivityBeans);
		model.addAttribute("keyword", keyword);

		return "Activity/Id";

	}

	@GetMapping("/registration")//當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入
	public String MultiMember( Model model) {
		 model.addAttribute("111", new MultiMember());
		return "Activity/Register";
	}
	
	
	
	@PostMapping("/store")//使用者按下儲存的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
	public String addMultiMember(  
			@ModelAttribute("111") MultiMember members,	Model model)  {
//		System.out.println(members.getActivity().getActivity_id());
		 
		multiService.addForm(members);
		return "redirect:/registration";
	}
	
//	@PostMapping("/store")//使用者按下儲存的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
//	public String addMultiMember(  
//			@ModelAttribute("111") MultiMember members,	Model model)  {
////		System.out.println(members.getActivity().getActivity_id());
//		
//		multiService.addForm(members);
//		return "Activity/Register";
//	}
	
//	@Post
//	@PostMapping("/add")
//	public String addMultiMember(  @RequestParam("activity_id") Activity activity_id,
//			   @RequestParam("member_number") Member member_number,
//               @RequestParam("activityDescription") String activityDescription,Model model) {
//		
//		model.addAttribute("111", new MultiMember());
//		return "Activity/Register";
//	}
	
	

//	    @PostMapping("/registration")
//	    public String Regester(Model model) {
//	    	
//	    	return "Activity/Regester";
//	    }

	public FrontActivityController() {
	}

}
