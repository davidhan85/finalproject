package com.team5.finalTopic.controller.Activity;

import org.springframework.web.bind.annotation.GetMapping;

public class HomePageController {

	@GetMapping("/")
	public String index() {
		return "Activity/HomePage" ; 
	}
	
}
