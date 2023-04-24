package com.team5.finalTopic.service.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.cs.CustomerComplaints;
import com.team5.finalTopic.model.cs.CustomerComplaintsRepository;

@Service
public class CustomerComplaintsService {
	
	@Autowired
	private CustomerComplaintsRepository  CCR;
	
	public void addForm(CustomerComplaints CC) {
		CCR.save(CC);
	}
	
}
