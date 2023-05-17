package com.team5.finalTopic.controller.Activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
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
import com.team5.finalTopic.model.Activity.SignUp;
import com.team5.finalTopic.model.Activity.SignupRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.Activity.ActServiceImpl;
import com.team5.finalTopic.service.Activity.MultiService;
import com.team5.finalTopic.service.Activity.SignupService;
import com.team5.finalTopic.service.member.MemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;

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
	private SignupRepository signRepository;

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
		return "Activity/search111";		
	}
	


	// 關鍵字查詢
	@GetMapping("/searching")
	public String showActivity(@RequestParam("keyword") String keyword, Model model) {
		String keyword1 = keyword.toString();
		List<Activity> ActivityBeans = actService.ActivitylistAll(keyword1);
		model.addAttribute("searchactivities", ActivityBeans);
		model.addAttribute("keyword", keyword);

		return "Activity/Id";

	}


	@PostMapping("/registration")//1.當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入，使用者會自己手動輸入，demo先用post
	public String MultiMember(Model model) {
		model.addAttribute("111", new MultiMember());
		return "Activity/Register";
	}
	
	
//	@GetMapping("/registration")//1.當使用者按下我要報名的按鈕，會給一個空白的表單讓使用者輸入，使用者會自己手動輸入
//	public String MultiMember(Model model,@RequestParam(name="activity_id")Integer activity_id) {
//	    MultiMember multiMember = new MultiMember();
//		Activity activityId = actRepository.findById(activity_id).get();
//	    multiMember.setActivity(activityId); // 将接收到的activity_id设置到MultiMember对象中	    
//	    model.addAttribute("act", activityId);
//		model.addAttribute("111", multiMember);
//		return "Activity/Register111";
//	}


	
	@PostMapping("/store")//2.使用者按下再新增的按鈕，會跑到另外一個畫面問使用者是否需要再新增一個活動報名資訊，是的話進入registration給新的表單，按下不用新增，下一步會跑到繳交畫面
	public String addMultiMember(  
			@ModelAttribute("111") MultiMember memberss, Model model)  {
//		@RequestParam(name="activity_id")Integer activity_id
		System.out.println("活動編號為"+memberss.getName());
		multiService.addForm(memberss);
//	提升使用者測試	Activity activityId = actRepository.findById(activity_id).get();
//		memberss.setActivity(activityId); 
//		multiRepository.save(memberss);
		return "Activity/Choices";
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
//	@GetMapping("/next") 
//	public String Next(@RequestParam("id") Integer id,Model model) {
////		@ModelAttribute("multiMember")
//		System.out.println(id);
//		List<MultiMember> multiMember = multiRepository.findDataByMemberNumber(id);
////		 Member member = mberService.findById(id);
////		 MultiMember multiMember=new MultiMember();
////		 multiMember.setMemberss(member);	
//		List<SignUp> signs = signRepository.findByPaystatus("已繳款");
//		model.addAttribute("multis",multiMember);
//		model.addAttribute("sign",signs);
//		
//		return "Activity/multiList";
//	}


	

	@ResponseBody
	@PostMapping("/ecpayCheckout")
	public String ecpayCheckout (SignUp signup,@RequestParam(name="member_number") Integer membernumber,@RequestParam(name="activity_id") Integer activity_id,@RequestParam(name="id") Integer id)  {
		
		String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
		
		
		AllInOne all = new AllInOne("");
		AioCheckOutDevide obj = new AioCheckOutDevide();

		obj.setMerchantID("1");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		obj.setMerchantTradeNo(uuId);// 設定交易編號
		obj.setMerchantTradeDate(sdf.format(new Date()));// 設定交易日期時間
		obj.setTotalAmount("100");// 設定交易金額
		obj.setTradeDesc("test Description");// 設定交易描述
		obj.setItemName("活動結帳");// 設定商品名稱
		obj.setReturnURL("http://localhost:8079/finalTopic_5/ReturnURL");// 設定付款完成後返回的網址
		System.out.println("123");
		Member member_number = MR.findById(membernumber).get();	
		System.out.println("123");
		Activity activityId = actRepository.findById(activity_id).get();
		MultiMember signid = multiRepository.findById(id).get();
		System.out.println("1111");
		signup.setMember(member_number);
		signup.setSignactivity(activityId);
		signup.setMemberSign(signid);
		signup.setAmounts(100);
		signup.setPaystatus("已繳款");
		signup.setSignup_date(new Date());
//		signup.setSignactivity(activityId);
		signService.addSignup(signup);
		System.out.println("11111");
		obj.setOrderResultURL("http://localhost:8079/finalTopic_5/paid?id="+membernumber);
		obj.setNeedExtraPaidInfo("N");// 設定是否需要額外付款資訊
		String form = all.aioCheckOut(obj, null);// 透過 all.aioCheckOut() 方法獲得表單
		return form;

		}
		
	@PostMapping("/paid")
	public String Paid(@RequestParam("id") Integer id,Model model) {
//		@ModelAttribute("multiMember")
		System.out.println(id);
//		SignUp sign = new SignUp();
		System.out.println("123");

		List<SignUp> signMember = signRepository.findSignupByMemberNumber(id);
		
		
		model.addAttribute("sign",signMember);
		return "Activity/signList";
	}
	

	public FrontActivityController() {
	}

}
