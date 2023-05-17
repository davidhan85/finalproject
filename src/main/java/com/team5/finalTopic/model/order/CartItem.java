package com.team5.finalTopic.model.order;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.member.Member;



@Entity
@Table(name="CartItem")
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CartItemID")
	private Integer cartItemID;


//
//	@OneToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "Id") // 產品圖片
//	private ProductImage productImage;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ProductId", columnDefinition="int", nullable = false) // 產品id
	private ListedProduct listedProduct;


	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_number",nullable = false)
	private Member member;
	
	public Member getMember() {
		return member;
	}

  

	public void setMember(Member member) {
		this.member = member;
	}

//
//
//	@ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "cart_id", referencedColumnName = "id")
//    private Cart cart;
	
	
	@Column(name = "quantity")
	private  Integer quantity;
	
	public Integer getCartItemID() {
		return cartItemID;
	}






	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}



	public void setCartItemID(Integer cartItemID) {
		this.cartItemID = cartItemID;
	}



	public ListedProduct getListedProduct() {
		return listedProduct;
	}



	public void setListedProduct(ListedProduct listedProduct) {
		this.listedProduct = listedProduct;
	}





//	public Cart getCart() {
//		return cart;
//	}
//
//
//
//	public void setCart(Cart cart) {
//		this.cart = cart;
//	}





	@Override
	public String toString() {
		return "CartItem [cartItemID=" + cartItemID + ", +  listedProduct=" + listedProduct
				+ ", + totalPrice=" + "]";
	}



	public void remove(CartItem cartItem) {
		// TODO Auto-generated method stub
		
	}



	public void updateQuantity(Integer quantity) {
		// TODO Auto-generated method stub
		
	}



	public void setListedProduct(String productName) {
		// TODO Auto-generated method stub
		
	}



	public void setListedProduct(Integer unitPrice) {
		// TODO Auto-generated method stub
		
	}



//	public void remove(CartItem cartItem) {
//		cartItem.remove(cartItem);
//		
//	}
	
//	@ManyToOne(cascade=CascadeType.ALL )
//	@JoinColumn(name = "MemberCouponID")
//	private MemberCoupon MemberCouponID;
	
	
}
