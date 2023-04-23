package com.team5.finalTopic.model.cs;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ComplaintType")
public class ComplaintType {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ComplaintTypeID ")
	private Integer ComplaintTypeID ;
	
	@Column(name="ComplaintName")
	private String ComplaintName;
	
	@Column(name="ComplaintDiscription")
	private String ComplaintDiscription;
	


	public Integer getComplaintTypeID() {
		return ComplaintTypeID;
	}

	public void setComplaintTypeID(Integer complaintTypeID) {
		ComplaintTypeID = complaintTypeID;
	}

	public String getComplaintName() {
		return ComplaintName;
	}

	public void setComplaintName(String complaintName) {
		ComplaintName = complaintName;
	}

	public String getComplaintDiscription() {
		return ComplaintDiscription;
	}

	public void setComplaintDiscription(String complaintDiscription) {
		ComplaintDiscription = complaintDiscription;
	}

}
