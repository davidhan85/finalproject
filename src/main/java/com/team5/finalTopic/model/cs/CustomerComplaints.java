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

@Entity
@Table(name = "CustomerComplaints ")
public class CustomerComplaints {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CustomerComplaintsID;
	private Date CreateDate;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_Customer_ID")
	private Member Customer;
	private String CustomerName;
	private String Email;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_Complaint_ID")
	private ComplaintType ComplaintType;
	private String Title;
	private String Content;

}
