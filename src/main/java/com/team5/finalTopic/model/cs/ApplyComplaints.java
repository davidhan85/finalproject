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

@Entity
@Table(name = "ApplyComplaints")
public class ApplyComplaints {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer applyComplaintsID;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm")
	@Column(name = "CreateDate", columnDefinition = "datetime")
	private Date createDate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_CustomerComplaints_ID", referencedColumnName = "CustomerComplaintsID")
	private CustomerComplaints customerComplaints;

	private String content;

	public Integer getApplyComplaintsID() {
		return applyComplaintsID;
	}

	public void setApplyComplaintsID(Integer applyComplaintsID) {
		this.applyComplaintsID = applyComplaintsID;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate() {

		this.createDate = new Date();
	}

	public CustomerComplaints getCustomerComplaints() {
		return customerComplaints;
	}

	public void setCustomerComplaints(CustomerComplaints customerComplaints) {
		this.customerComplaints = customerComplaints;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
