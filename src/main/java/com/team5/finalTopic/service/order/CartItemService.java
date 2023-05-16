package com.team5.finalTopic.service.order;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.controller.mall.ListedProductRepository;
import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.model.order.CartItem;
import com.team5.finalTopic.model.order.CartItemRepository;
import com.team5.finalTopic.model.order.Orders;

@Service
public class CartItemService {
	
	
	@Autowired
	private CartItemRepository cartItemRepo;
	
	
	@Autowired
	private ListedProductRepository listedProductRepository;

	@Autowired
	private MemberRepository memberRepository;
	

	
	public void CreateCart(Integer m_number,Integer ProductId,Integer quantity) {
		
		CartItem ci =new CartItem();
		Optional<Member> Moption = memberRepository.findById(m_number);
		
		Member m =Moption.get();
		
		ci.setMember(m);
		
		Optional<ListedProduct> Loption = listedProductRepository.findById(ProductId);
		
		ListedProduct lp= Loption.get();
		ci.setListedProduct(lp);
		
		ci.setQuantity(quantity);
		
		cartItemRepo.save(ci);
		
	}
//		
//		ListedProduct lp =poption.get();
		

//		ci.setListedProduct(firstProduct.getProductName()); // 設置ListedProduct屬性
//		ci.setListedProduct(firstProduct.getUnitPrice());

		
//		ci.setListedProduct(lp.getProductName());
		
		
		public List<CartItem> findById(Integer memberId){
			return cartItemRepo.findAllByMember(memberId);
						
		}
		
		public void removeCartItem(Integer cartItemID) {
//			cartItemRepo.deleteCartItemById(cartItemID);
			cartItemRepo.deleteById(cartItemID);
		}	
		
	
//		@Transactional
//		public void editByCartItem(Integer id,String newquantity) {
//		    Optional<CartItem> option = cartItemRepo.findById(id);
//
//		    if (option.isPresent()) {
//		        CartItem cartItem = option.get();
//		        cartItem.setQuantity(newquantity);
//		        cartItemRepo.save(cartItem);
//		    }
//		   
//		}

		
		public CartItem findCartById(Integer id) {
			Optional<CartItem> option = cartItemRepo.findById(id);
			
			if(option.isEmpty()) {
				return null;
			}
			
			return option.get();
		}
		
//		public void Shoppingcartcommit(Integer id,String newquantity) {
//		    Optional<CartItem> option = cartItemRepo.findById(id);
//
//		    if (option.isPresent()) {
//		        CartItem cartItem = option.get();
//		        cartItem.setQuantity(newquantity);
//		        cartItemRepo.save(cartItem);
//		    }
//		   
//		}
		
		
		
		
		
	
}	
	
	
	
	
	

	
//	public void addToCart(Integer productId) {
//        ListedProduct listedProduct = listedProductService.getListedProductById(productId);
////        Cart cart = cartservice.getCartFromDatabaseOrCreateNewCart();
//        CartItem cartItem = new CartItem();
//        cartItem.setListedProduct(listedProduct);   
//        cart.getCartItems().add(cartItem);
////        cartservice.saveCartToDatabase(cart);
//    }



	
//	public CartItem findCartById(Integer id) {
//		Optional<CartItem> option=cartItemRepo.findById(id);
//		
//		if(option.isEmpty()) {
//			return null;
//		}		
//		return option.get();
//	}
	
	
//	public void updateQuantity() {
//    for (CartItem cartItem : cartItems) {
//        if (cartItem.getCartItemID().equals(cartItemId)) {
//            cartItem.updateQuantity(quantity);
//            break;
//        }
//    }
//}


//	//<%-- 定義計算總價格的函數 --%>
//	    public double totalPrice(List<CartItem> cartItems) {
//	        double totalPrice = 0.0;
//	        for (CartItem item : cartItems) {
//	            totalPrice += item.istedProduct.getUnitPrice() * item.listedProduct.getProductQuantity();
//	        }
//	        return totalPrice;
//	    }
	
//	public void addToCart(Integer productId) {
//    // 根據商品id查詢商品信息
//	ListedProductService service = new ListedProductService();
//	ListedProduct listedProduct = service.getListedProductById(productId);	    
//    // 創建CartItem對象
//    CartItem cartItem = new CartItem();
//    cartItem.setListedProduct(listedProduct);
//    // 將CartItem添加到購物車中
//    Cart cart=new Cart();
//    cart.getCartItems().add(cartItem);   
//}每次添加商品時都會創建一個新的購物車，這樣會導致之前添加到購物車中的商品被清空
	
	
//	假設你有一個名為cartItems的List，其中包含多個CartItem對象，每個CartItem對象都需要設置屬性，你可以使用以下代碼來設置所有CartItem對象的屬性：
//
//	```
//	List<CartItem> cartItems = new ArrayList<>();
//
//	// 假設你有一個名為productIds的List，其中包含多個商品ID
//	List<Integer> productIds = Arrays.asList(1, 2, 3);
//
//	for (CartItem ci : cartItems) {
//	    // 設置會員
//	    Optional<Member> option = memberRepository.findById(ci.getMember().getMemberId());
//	    Member m = option.get();
//	    ci.setMember(m);
//	    
//	    // 設置商品列表
//	    List<ListedProduct> listedProducts = new ArrayList<>();
//	    for (Integer productId : productIds) {
//	        Optional<ListedProduct> productOption = listedProductRepository.findById(productId);
//	        ListedProduct product = productOption.get();
//	        listedProducts.add(product);
//	    }
//	    ci.setListedProducts(listedProducts);
//	    
//	    // 設置其他屬性
//	    // ...
//	}
//	```
//
//	在這個例子中，我們使用了一個for循環來遍歷所有的CartItem對象，並為每個CartItem對象設置了會員、商品列表和其他屬性。這樣就可以確保所有CartItem對象都被正確地設置了屬性值。
//}
