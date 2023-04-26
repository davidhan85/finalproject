package com.team5.finalTopic.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.finalTopic.model.cs.CustomerComplaints;
import com.team5.finalTopic.service.cs.CustomerComplaintsService;



@Controller
public class CustomerComplaintsController {
	
	@Autowired
	CustomerComplaintsService CSS;
	
	@GetMapping("/CustomerComplaints")
	public String CustomerComplaints(Model model) {
		
	    model.addAttribute("form", new CustomerComplaints());
		return "cs/ComplaintsForm";
	}
	
	@GetMapping("/chat")
	public String showChatPage(Model model) {
		return "cs/ChatRoom";
	}
	
	@PostMapping("/ComplaintsForm")
	public String postMessage(@ModelAttribute("form")CustomerComplaints cs,Model model) {
		

		 CSS.addForm(cs);
      
		model.addAttribute("form",new CustomerComplaints());
		
		return "cs/ComplaintsForm";
	}

}
