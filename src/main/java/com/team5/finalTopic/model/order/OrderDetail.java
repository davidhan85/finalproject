package com.team5.finalTopic.model.order;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderDetail")
public class OrderDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer ID;
	
	

	@Column(name = "ProductID",columnDefinition="NVARCHAR(30) NOT NULL")
	private String ProductID	;
	
	@Column(name = "ProductName",columnDefinition="NVARCHAR(50) NOT NULL")
	private String ProductName;
	
	@Column(name = "UnitPrice",columnDefinition="int NOT NULL")
	private Integer UnitPrice;
	
	@Column(name = "ProductQuantity",columnDefinition="int NOT NULL")
	private Integer ProductQuantity;
	
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OrderID")
    private Order order;
	
//	@ManyToOne
//    @JoinColumn(name = "ListedProduct")
//    private ListedProduct listedProduct;
	
	public OrderDetail(){
	}
	
	@Override
	public String toString() {
	    return "OrderDetail{" +
//	            "OrderID=" + OrderID +
	            ", ProductID='" + ProductID + '\'' +
	            ", ProductName='" + ProductName + '\'' +
	            ", UnitPrice='" + UnitPrice + '\'' +
	            ", ProductQuantity=" + ProductQuantity +
	            '}';
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

//	public String getOrderID() {
//		return OrderID;
//	}
//
//	public void setOrderID(String orderID) {
//		OrderID = orderID;
//	}

	public String getProductID() {
		return ProductID;
	}

	public void setProductID(String productID) {
		ProductID = productID;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public Integer getUnitPrice() {
		return UnitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		UnitPrice = unitPrice;
	}

	public Integer getProductQuantity() {
		return ProductQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		ProductQuantity = productQuantity;
	}


}
