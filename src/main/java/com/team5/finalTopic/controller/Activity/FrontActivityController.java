package com.team5.finalTopic.controller.Activity;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.model.Activity.ActRepository;
import com.team5.finalTopic.model.Activity.Activity;
import com.team5.finalTopic.model.Activity.MultiMember;
import com.team5.finalTopic.model.Activity.MultiMemberRepository;

import com.team5.finalTopic.model.cs.CustomerComplaints;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.Activity.ActService;
import com.team5.finalTopic.service.Activity.ActServiceImpl;
import com.team5.finalTopic.service.Activity.MultiService;
import com.team5.finalTopic.service.Activity.SignupService;

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

	@GetMapping("/activity")
	public String getAllActivities(Model model) {
		model.addAttribute("activities", actService.findAll());
		return "Activity/search";
	}

//	@GetMapping("/activity")
//	public String getAllActivities(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
//		Page<Activity> page = actService.findByPage(pageNumber);
//		
//		model.addAttribute("activities", page);
//		return "Activity/search";		
//	}

	// 關鍵字查詢
	@GetMapping("/searching")
	public String showActivity(@RequestParam("keyword") String keyword, Model model) {
		String keyword1 = keyword.toString();
		List<Activity> ActivityBeans = actService.ActivitylistAll(keyword1);
		model.addAttribute("searchactivities", ActivityBeans);
		model.addAttribute("keyword", keyword);

		return "Activity/Id";

	}

//	@GetMapping("/registration") // 當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入
//	public String MultiMember(@RequestParam("activity_id") Integer activity_id, Model model) {
//		model.addAttribute("activity_id", activity_id);
//		model.addAttribute("111", new MultiMember());
//		return "Activity/Register111";
//	}

	@GetMapping("/registration")//1.當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入，使用者會自己手動輸入
	public String MultiMember(Model model) {
		model.addAttribute("111", new MultiMember());
		return "Activity/Register";
	}

//	@PostMapping("/store")
//	public String store(@ModelAttribute("111") MultiMember memberss,
//			@RequestParam(name = "activity_id", required = true) Integer activity_id, Model model) {
//		multiService.addForm(memberss);
//	// 返回至報名頁面
//	return "redirect:/registration";
//	}
	
	@GetMapping("/store")//2.使用者按下再新增的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
	public String addMultiMember(  
			@ModelAttribute("111") MultiMember memberss, Model model)  {
//		System.out.println(members.getActivity().getActivity_id());
		multiService.addForm(memberss);
		return "redirect:/registration";
	}


//	}
//	@PostMapping("/next")
//	public String next(@ModelAttribute("multiMember") MultiMember multiMember, Model model) {
////	    Integer activity = multiMember.getActivity().getActivity_id(); // 讀取使用者報名的活動資料
////	    model.addAttribute("applies", activity); // 將活動資料傳到前端進行顯示
//	    model.addAttribute("multis", multiService); // 將活動資料傳到前端進行顯示	    
//	    return "Activity/multiList111"; // 跳轉到下一頁
//	 // 將報名表資料與活動資料儲存至資料庫中
//	   
//	}
	

//	@PostMapping("/next")
//	public String Next(Model model, @RequestParam("memberss.m_number") Integer mNumber) {
//	List<MultiMember> multiList = multiService.findAll().stream()
//	.filter(multi -> multi.getMemberss() != null && multi.getMemberss().getM_number() == mNumber)
//	.collect(Collectors.toList());
//	if (multiList.size() < 2) {
//	// 處理筆數不足的情況
//	model.addAttribute("errorMsg", "您只報名了 " + multiList.size() + " 筆活動，無法顯示列表");
//	return "errorPage";
//	}
//	model.addAttribute("multiList", multiList);
//	return "Activity/multiList";
//	}
	
	@PostMapping("/next")//3.
	public String Next(Model model) {
	List<MultiMember> multiList = multiService.findAll().stream()
	.filter(multi -> multi.getMemberss() != null && multi.getMemberss().getM_number() == 2)
	.collect(Collectors.toList());
	if (multiList.size() < 2) {
	// 處理筆數不足的情況
	model.addAttribute("errorMsg", "您只報名了 " + multiList.size() + " 筆活動，無法顯示列表");
	return "errorPage";
	}
	model.addAttribute("multiList", multiList);
	return "Activity/multiList";
	}
	
	


//	@PostMapping("/store")//使用者按下儲存的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
//	public String addMultiMember(  
//			@ModelAttribute("111") MultiMember members,	Model model)  {
////		System.out.println(members.getActivity().getActivity_id());
//		
//		multiService.addForm(members);
//		return "Activity/Register";
//	}



	public FrontActivityController() {
	}

}
