package com.team5.finalTopic.model.order;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="MemberCoupon")
public class MemberCoupon {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MemberCouponID")
	private Integer MemberCouponID;
	
	public Orders getOrders() {
		return Orders;
	}


	public void setOrders(Orders orders) {
		Orders = orders;
	}

	@Column(name = "member_number",columnDefinition="nvarchar(30)",nullable = false)
	private String member_number;
	
//	@Column(name = "coupon_id",columnDefinition="nvarchar(30) NOT NULL")
//	private String coupon_id;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "coupon_gettime",columnDefinition="datetime",nullable = false)
	private Date coupon_gettime;
	
	@Column(name = "coupon_status",columnDefinition="int",nullable = false)
	private Integer coupon_status;
	
	
	public MemberCoupon(){
	}
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="MemberCouponID")
    private Set<Coupon> coupon = new LinkedHashSet<>();
	
//	@ManyToOne(cascade=CascadeType.ALL )
//	@JoinColumn(name = "Member",nullable=false)
//	private Member Member;
//	
	@ManyToOne(cascade=CascadeType.ALL )
	@JoinColumn(name = "Orders",nullable=false)
	private Orders Orders;
	@Override
	public String toString() {
	    return "Order{" +
	            "MemberCouponID=" + MemberCouponID +
	            ", member_number='" + member_number + '\'' +
//	            ", coupon_id='" + coupon_id + '\'' +
	            ", coupon_gettime='" + coupon_gettime + '\'' +
	            ", coupon_status=" + coupon_status +
	            '}';
	}

	
	public Set<Coupon> getCoupon() {
		return coupon;
	}


	public void setCoupon(Set<Coupon> coupon) {
		this.coupon = coupon;
	}


	public Orders getOrder() {
		return Orders;
	}


	public void setOrder(Orders order) {
		Orders = order;
	}


	public Integer getMemberCouponID() {
		return MemberCouponID;
	}


	public void setMemberCouponID(Integer memberCouponID) {
		MemberCouponID = memberCouponID;
	}


	public String getMember_number() {
		return member_number;
	}


	public void setMember_number(String member_number) {
		this.member_number = member_number;
	}


//	public String getCoupon_id() {
//		return coupon_id;
//	}
//
//
//	public void setCoupon_id(String coupon_id) {
//		this.coupon_id = coupon_id;
//	}


	public Date getCoupon_gettime() {
		return coupon_gettime;
	}


	public void setCoupon_gettime(Date coupon_gettime) {
		this.coupon_gettime = coupon_gettime;
	}


	public Integer getCoupon_status() {
		return coupon_status;
	}


	public void setCoupon_status(Integer coupon_status) {
		this.coupon_status = coupon_status;
	}
	
	
	
	
}
