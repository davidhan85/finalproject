package com.team5.finalTopic.controller.cs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class CustomerComplaintsController {
	
	@GetMapping("/CustomerComplaints")
	public String CustomerComplaints(Model model) {
		
		return "cs/ComplaintsForm";
	}

}
