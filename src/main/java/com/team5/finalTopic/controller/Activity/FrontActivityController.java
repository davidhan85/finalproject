package com.team5.finalTopic.controller.Activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//	public String ButtonUpdateById(@RequestParam("id") Integer id,Model model) {
//		Activity msg = actService.findActivityByActivity_id(activity_id);
//		List<MultiMember> multiMember = multiRepository.findDataByMemberNumber(id);

//		model.addAttribute("messages",msg);
//		return "Activity/editPage";
//		
//	}
	

	

	
//	public void ecpayCheckout(Model model , HttpServletRequest request , HttpServletResponse response , HttpSession session) throws IOException {
//		
//		String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
//		SignUp ss = (SignUp) request.getAttribute("signup");
//		
//		
//		AllInOne all = new AllInOne("");
//		AioCheckOutDevide obj = new AioCheckOutDevide();
//
//		obj.setMerchantID("1");
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		sdf.setLenient(false);
////		obj.setMerchantTradeNo("1");// 設定交易編號
//		obj.setMerchantTradeDate(sdf.format(new Date()));// 設定交易日期時間
//		obj.setTotalAmount(ss.getAmounts().toString());// 設定交易金額
//		obj.setTradeDesc("test Description");// 設定交易描述
//		obj.setItemName("1001");// 設定商品名稱
//		obj.setReturnURL("http://localhost:8079/finalTopic_5/ReturnURL");// 設定付款完成後返回的網址
//		obj.setNeedExtraPaidInfo("N");// 設定是否需要額外付款資訊
//		String form = all.aioCheckOut(obj, null);// 透過 all.aioCheckOut() 方法獲得表單
//		
//		PrintWriter out = response.getWriter();
//		response.setContentType("text/html");
//		out.print(all.aioCheckOut(obj, null));
//		
	
	@ResponseBody
	@PostMapping("/ecpayCheckout")
	public String ecpayCheckout() {
		
		String aioCheckOutALLForm = signService.ecpayCheckout();
		
		return aioCheckOutALLForm;
	}
	
	
	@PostMapping("/ReturnURL")
	public void returnURL(@RequestParam("MerchantTradeNo") String MerchantTradeNo , @RequestParam("RtnCode") int RtnCode , @RequestParam("TradeAmt") int TradeAmt, HttpServletRequest request) {
		System.out.println("123");
		if((request.getRemoteAddr().equalsIgnoreCase("175.99.72.1")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.11")
				||  request.getRemoteAddr().equalsIgnoreCase("175.99.72.24")
				|| request.getRemoteAddr().equalsIgnoreCase("175.99.72.28")
				||  request.getRemoteAddr().equalsIgnoreCase("175.99.72.32")) && RtnCode ==1) {
			String IdStr = MerchantTradeNo.substring(13);
			int ssId = Integer.parseInt(IdStr);
			SignUp ss = signService.findSignUpById(ssId);   
			ss.setPaystatus("已繳款");
		}
		
		
	}
	
	
//	@PostMapping("returnURL")
//	public void returnURL(@RequestParam(""))
//	

	public FrontActivityController() {
	}

}
