package com.team5.finalTopic.model.order;

import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.Table;

@Entity
@Table(name="OrderDetail")
public class OrdersDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "ProductName",columnDefinition="NVARCHAR(50)",nullable = false)
	private String productName;
	
	@Column(name = "UnitPrice",columnDefinition="int",nullable = false)
	private Integer unitPrice;
	
	@Column(name = "ProductQuantity",columnDefinition="int",nullable = false)
	private Integer productQuantity;
	
	@ManyToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "orderID ")
	private Orders orders;

//	  @ManyToOne(cascade=CascadeType.ALL,fetch = FetchType.LAZY)
//	  @JoinColumn(name = "ProductId")
//	  private ListedProduct ProductId;

//	
//	@JsonManagedReference
//    @OneToMany(mappedBy = "pk.order")
//    @Valid
//    private List<OrderProduct> orderProducts = new ArrayList<>();

public OrdersDetail(){
	
}




//public Orders getOrders() {
//	return Orders;
//}
//
//
//public void setOrders(Orders orders) {
//	Orders = orders;
//}

//
//public ListedProduct getProductId() {
//	return ProductId;
//}
//
//
//public void setProductId(ListedProduct productId) {
//	ProductId = productId;
//}
//

public Integer getId() {
	return id;
}




public void setId(Integer id) {
	this.id = id;
}




public String getProductName() {
	return productName;
}




public void setProductName(String productName) {
	this.productName = productName;
}




public Integer getUnitPrice() {
	return unitPrice;
}




public void setUnitPrice(Integer unitPrice) {
	this.unitPrice = unitPrice;
}




public Integer getProductQuantity() {
	return productQuantity;
}




public void setProductQuantity(Integer productQuantity) {
	this.productQuantity = productQuantity;
}




public Orders getOrders() {
	return orders;
}




public void setOrders(Orders orders) {
	this.orders = orders;
}




@Override
public String toString() {
	return "OrdersDetail [id=" + id + ", productName=" + productName + ", unitPrice=" + unitPrice + ", productQuantity="
			+ productQuantity + ", orders=" + orders + "]";
}




//, ProductId=" + ProductId + "


}
