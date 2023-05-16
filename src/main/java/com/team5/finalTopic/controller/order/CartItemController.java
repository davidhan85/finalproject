package com.team5.finalTopic.controller.order;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.order.CartItem;
import com.team5.finalTopic.model.order.CartItemRepository;
import com.team5.finalTopic.service.order.CartItemService;
@Controller
public class CartItemController {

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private CartItemRepository cartItemRepository;

	@PostMapping("/cart/create/{m_number}/{productId}/{quantity}")
	public String Createcart(@PathVariable("m_number") Integer m_number,@PathVariable("productId") Integer ProductId,@PathVariable("quantity") Integer quantity ) {
		
		System.out.println( "會員名字"+m_number);
		System.out.println( "產品"+ProductId);
		System.out.println( "數量"+quantity);
		cartItemService.CreateCart(m_number,ProductId,quantity);
		return "redirect:/mall/ShowAllProduct";
	}
	

	@GetMapping("/cart/find/{m_number}")	
	public String findCart(@PathVariable("m_number")Integer m_number,Model model,HttpSession session) {

		Member member = (Member) session.getAttribute("memberbean");
	    if (member == null) {
	        // 如果 member 為 null，可以回傳一個錯誤頁面或轉導到登入頁面等等
	        return "index";
	    }
	    Integer memberId = member.getM_number();
	    List<CartItem> cartItems = cartItemService.findById(memberId);
	    model.addAttribute("cartItem", cartItems);
	    return "/orders/shoppingcart";
	}

//	public String findCart(Model model,HttpSession session) {
////		Integer memberid= (Integer)session.getAttribute("memberbean");
//		Member member = (Member) session.getAttribute("memberbean");
//		Integer memberId = Integer.valueOf(member.getM_number());
//		List<CartItem> cartItems = cartItemService.findById(memberId);
//		model.addAttribute("cartItem", cartItems);
//		return "/orders/shoppingcart";
//	}


	@DeleteMapping("/cart/delete/{cartItemID}")
	public String deleteCartItem(@PathVariable("cartItemID") Integer cartItemID,HttpSession session) {
	    cartItemService.removeCartItem(cartItemID);
	    Member member = (Member) session.getAttribute("memberbean");
	    Integer memberId = member.getM_number();
	    return "redirect:/cart/find/"+memberId;
	}


//	@GetMapping("/cart/edit")
//	public String editCartPage(@RequestParam("id") Integer id,Model model) {
//		CartItem CI = cartItemServcie.findCartById(id);
//
//		model.addAttribute("cartItem", CI);
//
//		return "orders/EditCartPage";
//	}
//
//	@PutMapping("/cart/edit")
//	public String putEditedCart(@ModelAttribute("Cart") CartItem cartitem) {
//		cartItemServcie.editByCartItem(cartitem.getCartItemID(),cartitem.getQuantity());
//		return "redirect:/orders/shoppingcart";
//	}


//	@GetMapping("/items")
//	public String getItems(Model model) {
//	    List<Item> items = itemService.getItems();
//	    model.addAttribute("items", items);
//	    return "items";
//	}
//
//	
//	@PostMapping("/items/{id}")
//	public String updateItem(@PathVariable("id") Long id, @ModelAttribute("item") Item item) {
//	    itemService.updateItem(id, item);
//	    return "redirect:/items";
//	}


//	    @PostMapping("/removecart")
//	    public String removeFromCart(@RequestParam("cartItemId") Integer cartItemId) {
//	        Cart cart = (Cart) session.getAttribute("cart");
//	        if (cart != null) {
//	            CartItem cartItemToRemove = cartItemServcie.findCartById(cartItemId);
//	            if (cartItemToRemove != null) {
//	                cart.removeCartItem(cartItemToRemove);
//	            }
//	            
//	            
//	            
//	        }
//	        return "redirect:/orders/shoppingcart";
//	    }
//
//	    
//	    @PostMapping("/updatequantity")
//	    public String updateQuantity(@RequestParam("cartItemId") Integer cartItemId, @RequestParam("quantity") Integer quantity, HttpSession session) {
//	        Cart cart = (Cart) session.getAttribute("cart");
//	        CartItem cartItemToUpdate = cartItemServcie.findCartById(cartItemId);
//	        
//	        if (cart != null) {
//	        	
//	        }
//	        return "redirect:/orders/shoppingcart";
//	    }


}



