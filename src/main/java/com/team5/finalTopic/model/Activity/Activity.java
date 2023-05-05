package com.team5.finalTopic.model.Activity;

import java.sql.Blob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

//測試中，測次完成
@Entity
@Table(name = "activity")
public class Activity {

	@Id
	@Column(name = "activity_id")
	private Integer activity_id;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "principle")
	private String principle;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "activity_name")
	private String activity_name;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(columnDefinition = "Date", name = "activity_date")
	private Date activity_date;

	@Column(columnDefinition = "Integer not null", name = "attendance")
	private Integer attendance;

	@Lob
	@Column(name = "activity_image")
	private byte[] activity_image;


	@Column(columnDefinition = "Integer not null", name = "activity_cost")
	private Integer activity_cost;

	@Column(columnDefinition = "NVARCHAR(MAX) not null", name = "activity_discription")
	private String activity_discription;

	public Integer getActivity_id() {//123
		return activity_id;
	}

	public void setActivity_id(Integer activity_id) {
		this.activity_id = activity_id;
	}

	public String getPrinciple() {
		return principle;
	}

	public void setPrinciple(String principle) {
		this.principle = principle;
	}

	public String getActivity_name() {
		return activity_name;
	}

	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}

	public Date getActivity_date() {
		return activity_date;
	}

	public void setActivity_date(Date activity_date) {
		this.activity_date = activity_date;
	}

	public Integer getAttendance() {
		return attendance;
	}

	public void setAttendance(Integer attendance) {
		this.attendance = attendance;
	}
	public byte[] getActivity_image() {
		return activity_image;
	}
	
	public void setActivity_image(byte[] activity_image) {
		this.activity_image = activity_image;
	}

	public Integer getActivity_cost() {
		return activity_cost;
	}

	public void setActivity_cost(Integer activity_cost) {
		this.activity_cost = activity_cost;
	}

	public String getActivity_discription() {
		return activity_discription;
	}

	public void setActivity_discription(String activity_discription) {
		this.activity_discription = activity_discription;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "activity")
	private Set<MultiMember> multis = new LinkedHashSet<>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "signactivity")
	private Set<SignUp> signmultis = new LinkedHashSet<>();
	
	public Activity() {

	}

}
