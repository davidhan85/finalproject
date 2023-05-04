package com.team5.finalTopic.model.member;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.board.MainArticleLikes;
import com.team5.finalTopic.model.board.MainArticleMessageLikes;
import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.board.SubArticleLikes;
import com.team5.finalTopic.model.board.SubArticleMessageLikes;
import com.team5.finalTopic.model.board.SubArticleMessages;
import com.team5.finalTopic.model.board.SubArticles;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "memberdata", uniqueConstraints = { @UniqueConstraint(columnNames = "member_number") })
@Getter
@Setter
@ToString
public class Member {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY) // SQL自動給號
	@Column(name = "member_number")
	Integer m_number;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_account")

	String m_account;

	@Column(columnDefinition = "NVARCHAR(20) not null", name = "member_password")
	String m_password;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_name")
	String m_name;

	@Column(columnDefinition = "NVARCHAR(20) not null", name = "member_phone")
	String m_phone;

	@Column(columnDefinition = "NVARCHAR(100) not null", name = "member_address")
	String m_address;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_email")
	String m_email;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@Column(columnDefinition = "Date", name = "member_birth")
	@DateTimeFormat(pattern = "yyyy-MM-dd")

	Date m_birth;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")

	@Column(columnDefinition = "datetime", name = "member_creatdate")
	Date m_creatdate;

	@Column(columnDefinition = "Integer", name = "member_points")
	Integer m_points;

	@Column(columnDefinition = "NVARCHAR(10) not null", name = "member_id")
	String m_id;
	@Lob
	@Column(name = "member_image", columnDefinition = "varbinary(MAX)")
	byte[] m_image; // 會員大頭貼

	@Column(columnDefinition = "int", name = "member_verify")
	Integer m_verify; // 加入會員的驗證碼

	String filename;

	@Transient
	MultipartFile productImage;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "point_id")
	private points point_id;

	public Integer getM_number() {
		return m_number;
	}

	public String getM_account() {
		return m_account;
	}

	public String getM_password() {
		return m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public String getM_address() {
		return m_address;
	}

	public String getM_email() {
		return m_email;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public Date getM_creatdate() {
		return m_creatdate;
	}

	public Integer getM_points() {
		return m_points;
	}

	public String getM_id() {
		return m_id;
	}

	public byte[] getM_image() {
		return m_image;
	}

	public void setM_image(byte[] m_image) {
		this.m_image = m_image;
	}

	public Integer getM_verify() {
		return m_verify;
	}

	public String getFilename() {
		return filename;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public points getPoint_id() {
		return point_id;
	}

	public void setM_number(Integer m_number) {
		this.m_number = m_number;
	}

	public void setM_account(String m_account) {
		this.m_account = m_account;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public void setM_creatdate(Date m_creatdate) {
		this.m_creatdate = m_creatdate;
	}

	@PrePersist
	protected void onCreate() {
		m_creatdate = new Date();
	}

	public void setM_points(Integer m_points) {
		this.m_points = m_points;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public void setM_verify(Integer m_verify) {
		this.m_verify = m_verify;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public void setPoint_id(points point_id) {
		this.point_id = point_id;
	}

	@OneToMany(mappedBy = "author_idforMA")
	Set<MainArticles> memberMainArticles = new LinkedHashSet<>();

	@OneToMany(mappedBy = "author_idforSA")
	Set<SubArticles> memberSubArticles = new LinkedHashSet<>();

	@OneToMany(mappedBy = "author_idforMAL")
	Set<MainArticleLikes> memberMainArticleLikes = new LinkedHashSet<>();

	@OneToMany(mappedBy = "author_idforMAM")
	Set<MainArticleMessages> memberMainArticleMessages = new LinkedHashSet<>();

	

	public Set<MainArticles> getMemberMainArticles() {
		return memberMainArticles;
	}

	public void setMemberMainArticles(Set<MainArticles> memberMainArticles) {
		this.memberMainArticles = memberMainArticles;
	}

	public Set<SubArticles> getMemberSubArticles() {
		return memberSubArticles;
	}

	public void setMemberSubArticles(Set<SubArticles> memberSubArticles) {
		this.memberSubArticles = memberSubArticles;
	}

	public Set<MainArticleLikes> getMemberMainArticleLikes() {
		return memberMainArticleLikes;
	}

	public void setMemberMainArticleLikes(Set<MainArticleLikes> memberMainArticleLikes) {
		this.memberMainArticleLikes = memberMainArticleLikes;
	}

	public Set<MainArticleMessages> getMemberMainArticleMessages() {
		return memberMainArticleMessages;
	}

	public void setMemberMainArticleMessages(Set<MainArticleMessages> memberMainArticleMessages) {
		this.memberMainArticleMessages = memberMainArticleMessages;
	}

	public Set<MainArticleMessageLikes> getMemberMainArticleMessageLikes() {
		return memberMainArticleMessageLikes;
	}

	public void setMemberMainArticleMessageLikes(Set<MainArticleMessageLikes> memberMainArticleMessageLikes) {
		this.memberMainArticleMessageLikes = memberMainArticleMessageLikes;
	}

	public Set<SubArticleLikes> getMemberSubArticleLikes() {
		return memberSubArticleLikes;
	}

	public void setMemberSubArticleLikes(Set<SubArticleLikes> memberSubArticleLikes) {
		this.memberSubArticleLikes = memberSubArticleLikes;
	}

	public Set<SubArticleMessages> getMemberSubArticleMessages() {
		return memberSubArticleMessages;
	}

	public void setMemberSubArticleMessages(Set<SubArticleMessages> memberSubArticleMessages) {
		this.memberSubArticleMessages = memberSubArticleMessages;
	}

	public Set<SubArticleMessageLikes> getMemberSubArticleMessageLikes() {
		return memberSubArticleMessageLikes;
	}

	public void setMemberSubArticleMessageLikes(Set<SubArticleMessageLikes> memberSubArticleMessageLikes) {
		this.memberSubArticleMessageLikes = memberSubArticleMessageLikes;
	}

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
