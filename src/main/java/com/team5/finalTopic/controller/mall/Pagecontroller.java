package com.team5.finalTopic.controller.mall;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team5.finalTopic.model.mall.ListedProduct;




@Controller
public class Pagecontroller {
	@GetMapping("/mall")
	public String mall() {
		return "/mall/mall";
	}
	@GetMapping("/Insertproduct")
	public String showInsertProductForm(Model model) {
		model.addAttribute("listedProduct", new ListedProduct());
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
