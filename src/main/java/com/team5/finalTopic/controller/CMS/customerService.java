package com.team5.finalTopic.controller.CMS;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team5.finalTopic.model.cs.CustomerComplaints;

@Controller
public class customerService {

	@GetMapping("/CMS")
	public String CustomerComplaints(Model model) {
			
		return "CMS/CMS";
	}
	
	
}
