package com.team5.finalTopic.service.cs;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.cs.ApplyComplaints;
import com.team5.finalTopic.model.cs.ApplyComplaintsRepository;
import com.team5.finalTopic.model.cs.ComplaintType;
import com.team5.finalTopic.model.cs.ComplaintTypeRepository;
import com.team5.finalTopic.model.cs.CustomerComplaints;
import com.team5.finalTopic.model.cs.CustomerComplaintsRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
public class CustomerComplaintsService {

	@Autowired
	private CustomerComplaintsRepository CCR;

	@Autowired
	private MemberRepository MR;

	@Autowired
	private ComplaintTypeRepository CTR;
	
	@Autowired
	private ApplyComplaintsRepository ACR;

	// 新增資料
	public void addForm(CustomerComplaints CC) {

		ComplaintType type = null;

		if (CC.getComplaintType().getComplaintTypeID() != 0) {
			type = CTR.findById(CC.getComplaintType().getComplaintTypeID()).orElse(null);
		}

		Member customer = MR.findById(CC.getCustomer().getM_number()).orElse(null);
		CC.setCreateDate();
		CC.setCustomer(customer);
		CC.setComplaintType(type);
		CCR.save(CC);
		CCR.flush();
	}

	// 搜尋全部資料
	public List<CustomerComplaints> FindAllComplaints() {

		return CCR.findAll();
	}

	// 透過id尋找資料
	public Optional<CustomerComplaints> GetComplaintsByID(int id) {

		return CCR.findById(id);
	}

	// 透過姓名尋找資料
	public List<CustomerComplaints> GetComplaintsByName(String name) {

		return CCR.findByCustomerName(name);

	}

	// 透過類型尋找資料
	public List<CustomerComplaints> GetComplaintsByType(String name) {

		return CCR.findByTypeName(name);

	}
	
	//新增客服回答
	public ApplyComplaints addApplyComplaints(CustomerComplaints CC,String content) {

		ApplyComplaints AC =  new ApplyComplaints();
		
		AC.setCreateDate();
		AC.setCustomerComplaints(CC);
		AC.setContent(content);
	    AC = ACR.save(AC);
		ACR.flush();
		return AC;
	}

}
