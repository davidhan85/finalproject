package com.team5.finalTopic.controller.mall;

import com.team5.finalTopic.annotation.MemberLogin;
import com.team5.finalTopic.model.member.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team5.finalTopic.model.mall.ListedProduct;

import javax.servlet.http.HttpSession;


@Controller
public class Pagecontroller {
	@GetMapping("/mall")
	public String mall() {
		return "/mall/mall";
	}
	@GetMapping("/Insertproduct")
	@MemberLogin
	public String showInsertProductForm(Model model, HttpSession session) {
		model.addAttribute("listedProduct", new ListedProduct());
//		Member member= (Member) session.getAttribute("memberbean");
//		Integer memberId=member.getM_number();
//		System.out.println("memberId:"+memberId);
	    return "/mall/Insertproduct";
	}
	@GetMapping("/ShowAllProduct")
	public String ShowAllProduct() {
		return "/mall/ShowAllProduct";
	}

	@GetMapping("/productDetail")
	public String mallshowone() {

		return "/mall/productDetail";
	}


}
