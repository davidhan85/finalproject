package com.team5.finalTopic.model.Activity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "multiMember")
public class MultiMember {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // SQL自動給號
	@Column(name = "id") // 流水號
	private Integer id;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "name")
	private String name;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "email")
	private String email;

//	@Column(name = "activity_id")
//	private Integer activity_id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "activity_id", referencedColumnName = "activity_id")
	private Activity activity;

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}



	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_number", referencedColumnName = "member_number") // join column寫在多方，mapped by 是參考對面的，例如這裡參考MultiMember的activity
	private Member memberss;

	public Member getMemberss() {
		return memberss;
	}

	public void setMemberss(Member memberss) {
		this.memberss = memberss;
	}

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

	@OneToOne(mappedBy = "memberSign")
	private SignUp sign;
	
	public SignUp getSign() {
		return sign;
	}

	public void setSign(SignUp sign) {
		this.sign = sign;
	}

	public MultiMember() {

	}

}
