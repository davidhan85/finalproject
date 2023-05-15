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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
    private Integer m_number;

	@NotBlank(message = "帳號不能為空")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$", message = "帳號必須包含英文字母和數字，並且長度在8-16之間")
	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_account",unique = true)
	private	String m_account;

	@NotBlank(message = "密碼不能為空")
//	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$", message = "密碼必須包含英文字母和數字，並且長度在8-16之間")
	@Column(columnDefinition = "NVARCHAR(20) not null", name = "member_password")
	private	String m_password;

	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_name")
	private	String m_name;

	@Pattern(regexp = "^09[0-9]{8}$", message = "手機號碼格式不正確")
	@Column(columnDefinition = "NVARCHAR(20) not null", name = "member_phone")
	private	String m_phone;

	@Column(columnDefinition = "NVARCHAR(100) not null", name = "member_address")
	private	String m_address;

	@Email(message = "信箱格式不正確")
	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_email")
	private	String m_email;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@Column(columnDefinition = "Date", name = "member_birth")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private	Date m_birth;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime", name = "member_creatdate", nullable = false, updatable = false )
	private	Date m_creatdate;

	@Column(columnDefinition = "Integer", name = "member_points")
	private	Integer m_points=0;

	@Pattern(regexp = "^[A-Z][1	2]\\d{8}$", message = "身分證字號格式不正確")
	@Column(columnDefinition = "NVARCHAR(10) not null", name = "member_id")
	private	String m_id;
	
	@Column(columnDefinition = "NVARCHAR(50) not null", name = "member_Role")
	private	String m_Role;
	
	@Column(columnDefinition = "NVARCHAR(50)  default 'false' ",name = "member_status")
	private String m_status="false";

	@Lob
	@Column(name = "member_image", columnDefinition = "varbinary(MAX)")
	private	byte[] m_image; // 會員大頭貼

	@Column(columnDefinition = "NVARCHAR(100)", name = "member_verify")
	private	String m_verify; // 加入會員的驗證碼

	private	String filename;

	@Transient
	private	MultipartFile productImage;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "point_id")
	private points point_id;

	public Integer getM_number() {
		return m_number;
	}

	public String getM_verify() {
		return m_verify;
	}
	

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public void setM_verify(String m_verify) {
		this.m_verify = m_verify;
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


	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public void setPoint_id(points point_id) {
		this.point_id = point_id;
	}
	

	public String getM_Role() {
		return m_Role;
	}

	public void setM_Role(String m_Role) {
		this.m_Role = m_Role;
	}


	@OneToMany(mappedBy = "authoridforMA")
	@JsonIgnoreProperties("authoridforMA")
	Set<MainArticles> memberMainArticles = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforSA")
	@JsonIgnoreProperties("authoridforSA")
	Set<SubArticles> memberSubArticles = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforMAL")
	@JsonIgnoreProperties("authoridforMAL")
	Set<MainArticleLikes> memberMainArticleLikes = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforMAM")
	@JsonIgnoreProperties("authoridforMAM")
	Set<MainArticleMessages> memberMainArticleMessages = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforMAML")
	@JsonIgnoreProperties("authoridforMAML")
	Set<MainArticleMessageLikes> memberMainArticleMessageLikes = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforSAL")
	@JsonIgnoreProperties("authoridforSAL")
	Set<SubArticleLikes> memberSubArticleLikes = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforSAM")
	@JsonIgnoreProperties("authoridforSAM")
	Set<SubArticleMessages> memberSubArticleMessages = new LinkedHashSet<>();

	@OneToMany(mappedBy = "authoridforSAML")
	@JsonIgnoreProperties("authoridforSAML")
	Set<SubArticleMessageLikes> memberSubArticleMessageLikes = new LinkedHashSet<>();

	public Member() {
	}

}
