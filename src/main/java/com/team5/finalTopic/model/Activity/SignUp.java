package com.team5.finalTopic.model.Activity;

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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "signup")
public class SignUp {

	//member_number靠關聯式連起來，跟會員的連起來
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //SQL自動給號
	@Column(name="id") //流水號
	private Integer id;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "activity_id")
	private Activity signactivity;
	
	

	public Activity getSignactivity() {
		return signactivity;
	}


	public void setSignactivity(Activity signactivity) {
		this.signactivity = signactivity;
	}


	@Column(columnDefinition = "NVARCHAR(50) not null",name="paystatus")
	private String paystatus; 
	
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	@Column(columnDefinition = "Date",name="signup_date")
	private   Date signup_date; 
	
	
	@ManyToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name = "member_number")
	private Member member;


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	


	public Date getSignup_date() {
		return signup_date;
	}


	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}


	


	

	public String getPaystatus() {
		return paystatus;
	}


	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}


	public SignUp() {
		
		
	}

}
