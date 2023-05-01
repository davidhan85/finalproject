package com.team5.finalTopic.controller.cs;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String postMessage(@ModelAttribute("form") CustomerComplaints cs, Model model) {

		CSS.addForm(cs);

		model.addAttribute("form", new CustomerComplaints());

		return "cs/ComplaintsForm";
	}

	@GetMapping("/showAllComplaintsPage")
	public String showAllComplaints(Model model) {
		List<CustomerComplaints> AllComplaints = CSS.FindAllComplaints();
		model.addAttribute("AllComplaints", AllComplaints);
		return "CMS/ShowAllCompliants";
	}

	// 用ajax呈現全部資料
	@GetMapping("/showAllComplaints")
	public ResponseEntity<List<CustomerComplaints>> showAllComplaints() {
		List<CustomerComplaints> allComplaints = CSS.FindAllComplaints();
		return ResponseEntity.ok().contentType(MediaType.valueOf("application/json")).body(allComplaints);
	}

	// 透過id取得資料
	@GetMapping("/getComplaintsByID")
	public ResponseEntity<List<CustomerComplaints>> getComplaintsByID(@RequestParam("id") Integer id) {

		List<CustomerComplaints> Complaints = new ArrayList<CustomerComplaints>();
		if (CSS.GetComplaintsByID(id).isPresent()) {
			CustomerComplaints complaint = CSS.GetComplaintsByID(id).get();
			Complaints.add(complaint);
		}
		return ResponseEntity.ok().contentType(MediaType.valueOf("application/json")).body(Complaints);
	}
	// 透過name取得資料
	@GetMapping("/getComplaintsByName")
	public ResponseEntity<List<CustomerComplaints>> getComplaintsByName(@RequestParam("name") String name) {

		List<CustomerComplaints> Complaints = new ArrayList<CustomerComplaints>();

		Complaints = CSS.GetComplaintsByName(name);

		return ResponseEntity.ok().contentType(MediaType.valueOf("application/json")).body(Complaints);
	}

	// 透過類型取得資料
	@GetMapping("/getComplaintsByType")
	public ResponseEntity<List<CustomerComplaints>> getComplaintsByType(@RequestParam("type") String type) {

		List<CustomerComplaints> Complaints = new ArrayList<CustomerComplaints>();
	
		Complaints = CSS.GetComplaintsByType(type);

		return ResponseEntity.ok().contentType(MediaType.valueOf("application/json")).body(Complaints);
	}
	
}
