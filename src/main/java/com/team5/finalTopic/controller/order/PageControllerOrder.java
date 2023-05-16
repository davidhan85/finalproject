package com.team5.finalTopic.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageControllerOrder {

//	@GetMapping("/")
//	public String home(Model model) {
//		return "index";
//	}

//	@GetMapping("/shoppingcart")
//	public String shoppingcart(){
//		
//		return"shoppingcart";
//	}
	
//	@GetMapping("/OrderMainPage")
//	public String OrderMainPage(){
//		
//		return"OrderMainPage";
//	}

	@GetMapping("/AddOrderPage")
	public String AddOrderPage(){
		
		return"AddOrderPage";
	}

	@GetMapping("/shoppingcartnew")
	public String Shoppingcartpage(){
		
		return"/orders/shoppingcartnew";
	}
	
	@GetMapping("/indexcartnew")
	public String Indexcartpage(){
		
		return"/orders/indexcartnew";
	}
	
	
	@GetMapping("/indexbackg")
	public String backpage(){
		
		return"/orders/indexbackg";		
	}
	
	
	@GetMapping("/index/cart")
	public String indexcart(){
		
		return"/index";		
	}
	
}


