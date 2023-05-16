package com.team5.finalTopic.controller.order;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.order.Coupon;
import com.team5.finalTopic.model.order.MemberCoupon;
import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.service.order.MemberCouponService;

@Controller
public class MemberCouponController {
	
	@Autowired
	private MemberCouponService memberCouponService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	@GetMapping("/memberCoupon")
	public String goShowCoupon(@RequestParam(name="p",defaultValue="1") Integer pageNumber,Model model){
		Page<MemberCoupon> page =memberCouponService.findByPage(pageNumber);
		 model.addAttribute("page",page);
		return "order/showmemberCoupon";

	}
	
	@GetMapping("/memberCoupon/add")
	public String addCoupon(Model model) {
		model.addAttribute("memberCoupon", new Orders());
		return "orders/addMemberCouponPage";		
	}
	
	@PostMapping("/memberCoupon/post")
	public String postCoupon(@ModelAttribute("memberCoupon") MemberCoupon mcou,Model model) {
		memberCouponService.addMemberCoupon(mcou);
		
		model.addAttribute("memberCoupon", new Orders());
//		MemberCoupon latest = memberCouponService.getLatest();
//		model.addAttribute("latest", latest);
		
		return "orders/addMemberCouponPage";
	}
	
	@GetMapping("/memberCoupon/edit")
	public String editCoupon(@RequestParam("id") Integer id,Model model) {
		MemberCoupon cou = memberCouponService.findMemberCouponById(id);
		
		model.addAttribute("memberCoupon", cou);
		
		return "orders/editmemberCouponPage";
	}
	
	@PutMapping("/memberCoupon/edit")
	public String putEditedCoupon(@ModelAttribute("Coupon") MemberCoupon mcou) {
		memberCouponService.updateMemberCouponById(mcou.getMemberCouponID(), mcou.getMember_number());
		return "redirect:/memberCoupon";
	}
	
	@DeleteMapping("/memberCoupon/delete")
	public String deleteCoupon(@RequestParam Integer id) {
		memberCouponService.deleteMemberCouponById(id);
		return "redirect:/memberCoupon";
	}
	
	@ResponseBody
	@PostMapping("/api/memberCoupon/post")
	public Page<MemberCoupon> postCouponApi(@RequestBody MemberCoupon cou){
		memberCouponService.addMemberCoupon(cou);
		Page<MemberCoupon> page = memberCouponService.findByPage(1);
		return page;
	}
}
