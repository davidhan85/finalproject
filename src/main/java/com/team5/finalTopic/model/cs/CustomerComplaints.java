package com.team5.finalTopic.model.cs;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "CustomerComplaints ")
public class CustomerComplaints {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CustomerComplaintsID;
	private Date CreateDate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_Customer_ID")
	private Member Customer;
	private String CustomerName;

	public Integer getCustomerComplaintsID() {
		return CustomerComplaintsID;
	}

	public void setCustomerComplaintsID(Integer customerComplaintsID) {
		CustomerComplaintsID = customerComplaintsID;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}

	public Member getCustomer() {
		return Customer;
	}

	public void setCustomer(Member customer) {
		Customer = customer;
	}

	public String getCustomerName() {
		return CustomerName;
	}

	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public ComplaintType getComplaintType() {
		return ComplaintType;
	}

	public void setComplaintType(ComplaintType complaintType) {
		ComplaintType = complaintType;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	private String Email;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_ComplaintType_ID")
	private ComplaintType ComplaintType;
	private String Title;
	private String Content;

}
