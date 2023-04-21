package com.team5.finalTopic.model.order;

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

@Entity
@Table(name="Coupon")
public class Coupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "coupon_id")
	private Integer coupon_id;
	

	@Column(name = "coupon_type",columnDefinition="int",nullable = false)
	private Integer coupon_type;
	
	@Column(name = "coupon_name",columnDefinition="NVARCHAR(50)",nullable = false)
	private String coupon_name;
	
	@Column(name = "coupon_count",columnDefinition="int",nullable = false)
	private Integer coupon_count;
	
	@Column(name = "coupon_amount",columnDefinition="NVARCHAR(50)",nullable = false)
	private String coupon_amount;
	
	@Column(name = "coupon_enabletime",columnDefinition="datetime",nullable = false)
	private Date coupon_enabletime;
	
	@Column(name = "note",columnDefinition="NVARCHAR(200)", nullable = false)
	private String note;
	
	@ManyToOne(cascade=CascadeType.ALL )
	@JoinColumn(name = "MemberCouponID")
	private MemberCoupon MemberCouponID;
	
	
	
	@Override
	public String toString() {
	    return "Order{" +
	            "coupon_id=" + coupon_id +
	            ", coupon_type='" + coupon_type + '\'' +
	            ", coupon_name='" + coupon_name + '\'' +
	            ", coupon_count='" + coupon_count + '\'' +
	            ", coupon_amount='" + coupon_amount + '\'' +
	            ", coupon_enabletime='" + coupon_enabletime + '\'' +
	            ", note=" + note +
	            '}';
	}

	public MemberCoupon getMemberCouponID() {
		return MemberCouponID;
	}

	public void setMemberCouponID(MemberCoupon memberCouponID) {
		MemberCouponID = memberCouponID;
	}
	
	public Integer getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
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

	public Date getCoupon_enabletime() {
		return coupon_enabletime;
	}

	public void setCoupon_enabletime(Date coupon_enabletime) {
		this.coupon_enabletime = coupon_enabletime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}
