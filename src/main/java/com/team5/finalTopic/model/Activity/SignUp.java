package com.team5.finalTopic.model.Activity;

import java.util.Date;

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
	Integer id;
	
	@ManyToOne
	@JoinColumn(name = "activity_id")
	private Activity activity_id;
	
	@Column(columnDefinition = "NVARCHAR(50) not null",name="paystatus")
	String paystatus; 
	
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	@Column(columnDefinition = "Date",name="signup_date")
	Date signup_date; 
	
	
	@ManyToOne
	@JoinColumn(name = "member_number")
	private Member m_number;
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Activity getActivity_id() {
		return activity_id;
	}


	public void setActivity_id(Activity activity_id) {
		this.activity_id = activity_id;
	}


	public Date getSignup_date() {
		return signup_date;
	}


	public void setSignup_date(Date signup_date) {
		this.signup_date = signup_date;
	}


	public Member getM_number() {
		return m_number;
	}


	public void setM_number(Member m_number) {
		this.m_number = m_number;
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
