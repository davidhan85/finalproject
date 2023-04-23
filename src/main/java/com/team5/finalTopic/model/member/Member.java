package com.team5.finalTopic.model.member;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.board.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Blob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name="memberdata",uniqueConstraints = {@UniqueConstraint(columnNames = "member_number")})
@Getter
@Setter
@ToString
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //SQL自動給號
	@Column(name="member_number")
	Integer m_number; 
	








	public Integer getM_number() {
		return m_number;
	}









	public Date getM_creatdate() {
		return m_creatdate;
	}






	public void setM_creatdate(Date m_creatdate) {
		this.m_creatdate = m_creatdate;
	}






	@Column(columnDefinition = "NVARCHAR(50) not null",name="member_account")
	String m_account;
	
	@Column(columnDefinition = "NVARCHAR(20) not null",name="member_password")
	String m_password;
	
	@Column(columnDefinition = "NVARCHAR(50) not null",name="member_name")
	String m_name;
	
	@Column(columnDefinition = "NVARCHAR(20) not null",name="member_phone")
	String m_phone;
	
	@Column(columnDefinition = "NVARCHAR(100) not null",name="member_address")
	String m_address;
	
	@Column(columnDefinition = "NVARCHAR(50) not null",name="member_email")
	String m_email;
	
	@Column(columnDefinition = "Date",name="member_birth")
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	Date m_birth;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime",name="member_creatdate")
	Date m_creatdate;
	
	@Column(columnDefinition = "Integer",name="member_points")
	Integer m_points;
	
	@Column(columnDefinition = "NVARCHAR(10) not null",name="member_id")
	String m_id;
	
	@Lob
	@Column(name="member_image")
	Blob m_image; //會員大頭貼

	@Column(columnDefinition = "int",name="member_verify")
	Integer m_verify; //加入會員的驗證碼

	String filename;

	@Transient
	MultipartFile productImage;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="point_id")
	private points point_id;
	
	@OneToMany(mappedBy = "author_idforMA")
	Set<MainArticles> memberMainArticles = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforSA")
	Set<SubArticles> memberSubArticles = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforMAL")
	Set<MainArticleLikes> memberMainArticleLikes = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforMAM")
	Set<MainArticleMessages> memberMainArticleMessages = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforMAML")
	Set<MainArticleMessageLikes> memberMainArticleMessageLikes = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforSAL")
	Set<SubArticleLikes> memberSubArticleLikes = new LinkedHashSet<>();

	@OneToMany(mappedBy = "author_idforSAM")
	Set<SubArticleMessages> memberSubArticleMessages = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "author_idforSAML")
	Set<SubArticleMessageLikes> memberSubArticleMessageLikes = new LinkedHashSet<>();
	
	
	
	
	
	
	public Member() {
	}

}
