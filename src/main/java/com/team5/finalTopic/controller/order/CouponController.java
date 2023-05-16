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
import org.springframework.web.bind.annotation.RestController;

import com.team5.finalTopic.model.order.Coupon;
import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.service.order.CouponService;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService CoService;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	@GetMapping("/coupon")
	public String goShowCoupon(@RequestParam(name="p",defaultValue="1") Integer pageNumber,Model model){
		Page<Coupon> page =CoService.findByPage(pageNumber);
		 model.addAttribute("page",page);
		return "orders/showCoupon";

	}
	
	@GetMapping("/coupon/add")
	public String addCoupon(Model model) {
		model.addAttribute("Coupon", new Orders());
		return "orders/addCouponPage";		
	}
	
	@PostMapping("/coupon/post")
	public String postCoupon(@ModelAttribute("Coupon") Coupon cou,Model model) {
		CoService.addCoupon(cou);
		
		model.addAttribute("orders", new Orders());
//		Coupon latest = CoService.getLatest();
//		model.addAttribute("latest", latest);
		
		return "orders/addCouponPage";
	}
	
	@GetMapping("/coupon/edit")
	public String editCoupon(@RequestParam("id") Integer id,Model model) {
		Coupon cou = CoService.findCouponById(id);
		
		model.addAttribute("Coupon", cou);
		
		return "orders/editCouponPage";
	}
	
	@PutMapping("/coupon/edit")
	public String putEditedCoupon(@ModelAttribute("Coupon") Coupon cou) {
		CoService.updateCouponById(cou.getCouponID(), cou.getCoupon_name());
		return "redirect:/coupon";
	}
	
	@DeleteMapping("/coupon/delete")
	public String deleteCoupon(@RequestParam Integer id) {
		CoService.deleteCouponById(id);
		return "redirect:/coupon";
	}
	
	@ResponseBody
	@PostMapping("/api/coupon/post")
	public Page<Coupon> postCouponApi(@RequestBody Coupon cou){
		CoService.addCoupon(cou);
		Page<Coupon> page = CoService.findByPage(1);
		
		return page;
	}
}
