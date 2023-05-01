package com.team5.finalTopic.model.cs;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "CustomerComplaints ")
public class CustomerComplaints {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CustomerComplaintsID;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	@Column(name = "CreateDate", columnDefinition = "datetime")
	private Date CreateDate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_Customer_ID", referencedColumnName = "member_number")
	private Member Customer;

	private String customerName;

	private String Email;

	private String Title;
	private String Content;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_ComplaintType_ID", referencedColumnName = "ComplaintTypeID")
	private ComplaintType ComplaintType;

	public Integer getCustomerComplaintsID() {
		return CustomerComplaintsID;
	}

	public void setCustomerComplaintsID(Integer customerComplaintsID) {
		CustomerComplaintsID = customerComplaintsID;
	}

	public Date getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate() {
		
		this.CreateDate = new Date();
	}

	public Member getCustomer() {
		return Customer;
	}

	public void setCustomer(Member customer) {
		Customer = customer;
	}

//	public String getCustomerName() {
//		return CustomerName;
//	}
//
//	public void setCustomerName(String customerName) {
//		CustomerName = customerName;
//	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
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

	public ComplaintType getComplaintType() {
		return ComplaintType;
	}

	public void setComplaintType(ComplaintType complaintType) {
		ComplaintType = complaintType;
	}

}
