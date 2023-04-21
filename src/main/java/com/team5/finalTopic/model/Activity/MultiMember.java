package com.team5.finalTopic.model.Activity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.team5.finalTopic.model.member.Member;
@Entity
@Table(name = "multiMember")
public class MultiMember {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //SQL自動給號
	@Column(name="id") //流水號
	Integer id; 
	
	@Column(columnDefinition = "NVARCHAR(50) not null",name="name") 
	String name; 
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Activity getActivity_id() {
		return activity_id;
	}


	public void setActivity_id(Activity activity_id) {
		this.activity_id = activity_id;
	}


	public Member getM_number() {
		return m_number;
	}


	public void setM_number(Member m_number) {
		this.m_number = m_number;
	}


	@Column(columnDefinition = "NVARCHAR(50) not null",name="email") 
	String email; 
	
//	@Column(name = "activity_id")
//	private Integer activity_id;
	
	@ManyToOne
    @JoinColumn(name = "activity_id", referencedColumnName = "activity_id")
    private Activity activity_id;
	
	@ManyToOne
    @JoinColumn(name = "member_number", referencedColumnName = "member_number")
    private Member m_number;
	
	
	public MultiMember() {
		
	}

}
