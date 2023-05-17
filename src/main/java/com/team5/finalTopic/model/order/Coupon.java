package com.team5.finalTopic.model.order;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="Coupon")
public class Coupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CouponID")
	private Integer couponID;
	

	@Column(name = "coupon_type",columnDefinition="int",nullable = false)
	private Integer coupon_type;
	
	@Column(name = "coupon_name",columnDefinition="NVARCHAR(50)",nullable = false)
	private String coupon_name;
	
	@Column(name = "coupon",columnDefinition="NVARCHAR(50)",nullable = false)
	private String coupon;
	
	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	@Column(name = "coupon_count",columnDefinition="int",nullable = false)
	private Integer coupon_count;
	
	@Column(name = "coupon_amount",columnDefinition="NVARCHAR(50)",nullable = false)
	private String coupon_amount;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
	@Column(name = "couponEnableTime",columnDefinition="datetime",nullable = false)
	private Date couponEnableTime;
	

	@Column(name = "note",columnDefinition="NVARCHAR(200)", nullable = false)
	private String note;
	
	@Column(name = "memberCouponID",columnDefinition="int",nullable = true)
	private String memberCouponID;




	public Integer getCouponID() {
		return couponID;
	}

	public void setCouponID(Integer couponID) {
		this.couponID = couponID;
	}

	public Integer getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(Integer coupon_type) {
		this.coupon_type = coupon_type;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public Integer getCoupon_count() {
		return coupon_count;
	}

	public void setCoupon_count(Integer coupon_count) {
		this.coupon_count = coupon_count;
	}

	public String getCoupon_amount() {
		return coupon_amount;
	}

	public void setCoupon_amount(String coupon_amount) {
		this.coupon_amount = coupon_amount;
	}



	public Date getCouponEnableTime() {
		return couponEnableTime;
	}

	public void setCouponEnableTime(Date couponEnableTime) {
		this.couponEnableTime = couponEnableTime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getMemberCouponID() {
		return memberCouponID;
	}

	public void setMemberCouponID(String memberCouponID) {
		this.memberCouponID = memberCouponID;
	}


	
//	@ManyToOne(cascade=CascadeType.ALL )
//	@JoinColumn(name = "MemberCouponID")
//	private MemberCoupon MemberCouponID;
	
	
}
