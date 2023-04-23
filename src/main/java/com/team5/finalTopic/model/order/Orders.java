package com.team5.finalTopic.model.order;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="Orders")
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderID")
	private Integer OrderID;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "CreatedTime",columnDefinition="datetime",nullable = false)
	private Date CreatedTime;		
	
	@Column(name = "Member_number",columnDefinition="int",nullable = false)
	private Integer Member_number;
	
	@Column(name = "BuyerID",columnDefinition="NVARCHAR(30)",nullable = false)
	private String BuyerID;
	
	@Column(name = "PaymentMethod",columnDefinition="NVARCHAR(30)",nullable = false)
	private String PaymentMethod;
	
	@Column(name = "ShippingMethod",columnDefinition="NVARCHAR(30)",nullable = false)
	private String ShippingMethod;
	
	@Column(name = "Coupon_id",columnDefinition="NVARCHAR(30)",nullable = false)
	private String Coupon_id;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="Orders")
	private Set<OrderDetail> orderDetail = new LinkedHashSet<>();
//	@ManyToOne
//    @JoinColumn(name = "member_number ")
//    private Member member;
	
//	@OneToMany(cascade=CascadeType.ALL, mappedBy="OrderID")
//    private Set<MemberCoupon> memberCoupon = new LinkedHashSet<>();
	@OneToMany(cascade=CascadeType.ALL, mappedBy="Orders")
	private Set<MemberCoupon> memberCoupon = new LinkedHashSet<>();
	
	public Set<MemberCoupon> getMemberCoupon() {
		return memberCoupon;
	}

	public void setMemberCoupon(Set<MemberCoupon> memberCoupon) {
		this.memberCoupon = memberCoupon;
	}

	public Orders(){		
		
	}
	
	@Override
	public String toString() {
	    return "Order{" +
	            "OrderID=" + OrderID +
	            ", CreatedTime='" + CreatedTime + '\'' +
	            ", Member_number='" + Member_number + '\'' +
	            ", BuyerID='" + BuyerID + '\'' +
	            ", PaymentMethod='" + PaymentMethod + '\'' +
	            ", ShippingMethod='" + ShippingMethod + '\'' +
	            ", Coupon_id=" + Coupon_id +
	            '}';
	}



	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Integer getOrderID() {
		return OrderID;
	}

	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}

	public Date getCreatedTime() {
		return CreatedTime;
	}

	public void setCreatedTime(Date createdTime) {
		CreatedTime = createdTime;
	}



	public Integer getMember_number() {
		return Member_number;
	}

	public void setMember_number(Integer member_number) {
		Member_number = member_number;
	}

	public String getBuyerID() {
		return BuyerID;
	}

	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}

	public String getPaymentMethod() {
		return PaymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}

	public String getShippingMethod() {
		return ShippingMethod;
	}

	public void setShippingMethod(String shippingMethod) {
		ShippingMethod = shippingMethod;
	}

	public String getCoupon_id() {
		return Coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		Coupon_id = coupon_id;
	}
	

	
}
