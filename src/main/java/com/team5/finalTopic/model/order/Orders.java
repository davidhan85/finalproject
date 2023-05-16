	package com.team5.finalTopic.model.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "Orders")
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderID")
	private Integer orderID;
	
	@OneToMany(mappedBy = "orders", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<OrdersDetail> orderDetails = new ArrayList<>();
	  
	public List<OrdersDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrdersDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	//	@JsonProperty("OrderNo")
	@Column(name = "orderNo",columnDefinition="NVARCHAR(20)")
	private String orderNo;
	
//	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd HH:mm:ss")
	@DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdTime",columnDefinition="datetime")
	private Date createdTime;

	@Column(name = "member_num",columnDefinition="int")
	private Integer member_num;

	@Column(name = "buyerID",columnDefinition="NVARCHAR(30)")
	private String buyerID;
	
	@Column(name = "paymentMethod",columnDefinition="NVARCHAR(20)")
	private String paymentMethoderNo;
	
	@Column(name = "shippingMethod",columnDefinition="NVARCHAR(20)")
	private String shippingMethod;
	
	@Column(name = "address",columnDefinition="NVARCHAR(80)")
	private String address;
	
	@Column(name = "paymentStatus ",columnDefinition="NVARCHAR(80)")
	private String paymentStatus ;
	


	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "coupon_id",columnDefinition="NVARCHAR(20)")
	private String coupon_id;

//	@OneToMany(cascade=CascadeType.ALL, mappedBy="")
//    private Set<MemberCoupon> set = new HashSet<>();
	
	
	@Override
	public String toString() {
		return "Orders [orderID=" + orderID + ", orderNo=" + orderNo + ", createdTime=" + createdTime + ", member_num="
				+ member_num + ", buyerID=" + buyerID + ", paymentMethoderNo=" + paymentMethoderNo + ", shippingMethod="
				+ shippingMethod + ", coupon_id=" + coupon_id + "]";
	}

	public Orders(){		
		
	}
	@PrePersist
    public void onCreate() {
        if(createdTime == null) {
        	createdTime = new Date();
        }
    }
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Integer getMember_num() {
		return member_num;
	}
	public void setMember_num(Integer member_num) {
		this.member_num = member_num;
	}
	public String getBuyerID() {
		return buyerID;
	}
	public void setBuyerID(String buyerID) {
		this.buyerID = buyerID;
	}
	public String getPaymentMethoderNo() {
		return paymentMethoderNo;
	}
	public void setPaymentMethoderNo(String paymentMethoderNo) {
		this.paymentMethoderNo = paymentMethoderNo;
	}
	public String getShippingMethod() {
		return shippingMethod;
	}
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}
	public String getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	
	
}


