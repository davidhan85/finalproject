package com.team5.finalTopic.controller.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.order.CartItem;
import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.model.order.OrdersRepository;
import com.team5.finalTopic.service.order.CartItemService;
import com.team5.finalTopic.service.order.OrdersService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;


@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService oService;
	
	@Autowired
	private CartItemService cartItemService;
	
	
	@Autowired
	private OrdersRepository ordersRepo;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
	
	@GetMapping("/orders/add")
	public String addOrders(Model model) {
		model.addAttribute("orders", new Orders());
		return "orders/addOrdersPage3";		
	}
	
	@PostMapping("/orders/post")
	public String postOrder(@ModelAttribute("orders") Orders ord,Model model) {
		oService.addOrders(ord);
		
		model.addAttribute("orders", new Orders());
		Orders latest = oService.getLatest();
		model.addAttribute("latest", latest);
		
		return "orders/showOrdersuccess";
	}
	
	@GetMapping("/orders/addShoppingcartcommit")
	public String addOrders2(Model model,HttpSession session) {
		Member member = (Member) session.getAttribute("memberbean");
	    if (member == null) {
	        // 如果 member 為 null，可以回傳一個錯誤頁面或轉導到登入頁面等等
	        return "index";
	    }
	    Integer memberId = member.getM_number();
	    List<CartItem> cartItems = cartItemService.findById(memberId);
	    model.addAttribute("cartItem", cartItems);
		model.addAttribute("orders", new Orders());
		return "orders/Shoppingcartcommit";		
	}
	
	@PostMapping("/orders/post2")
	public String postOrder2(@ModelAttribute("orders") Orders ord,Model model) {
		oService.addOrders(ord);
		
		model.addAttribute("orders", new Orders());
		Orders latest = oService.getLatest();
		model.addAttribute("latest", latest);
		
		return "orders/showOrdersuccess";
	}
	
	@GetMapping("/orders")
	public String goShowOrders(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<Orders> page = oService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		
		return "orders/showOrders";
	}
	
	@GetMapping("/orders/edit")
	public String editPage(@RequestParam("id") Integer id,Model model) {
		Orders ord = oService.findOrdersById(id);
		
		model.addAttribute("orders", ord);
		
		return "orders/editOrdersPage";
	}
	
	@PutMapping("/orders/edit")
	public String putEditedOrders(@ModelAttribute("orders") Orders ord) {
		oService.updateOrders(ord);
		return "redirect:/orders";
	}
	
	@DeleteMapping("/orders/delete")
	public String deleteOrders(@RequestParam Integer id) {
		oService.deleteOrdersById(id);
		return "redirect:/orders";
	}
	
	@ResponseBody
	@PostMapping("/api/orders/post")
	public Page<Orders> postOrdersApi(@RequestBody Orders ord){
		oService.addOrders(ord);
		
		Page<Orders> page = oService.findByPage(1);
		
		return page;
	}
	
	@GetMapping("/orders/ajax")
	public String ajaxPage() {
		return "orders/ajaxOrders";
	}
	
	@ResponseBody
	@PostMapping("/orderecpay")
	public String ecpayCheckout(Orders orders,@RequestParam(name="orderID") Integer orderID) {

		AllInOne all = new AllInOne("");
		AioCheckOutDevide obj = new AioCheckOutDevide();
		
		obj.setMerchantID("3002607");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		
		obj.setMerchantTradeDate(sdf.format(new Date()));
		obj.setTotalAmount("500");
		obj.setTradeDesc("test Description");
		obj.setItemName("sa105");
		obj.setReturnURL("http://localhost:8079:/returnURL");
		obj.setOrderResultURL("http://localhost:8079/finalTopic_5/orderecpayresponse?orderID="+orders.getOrderID());
		obj.setNeedExtraPaidInfo("N");
		Orders OID = oService.findOrdersById(orderID);						
		String testNo = UUID.randomUUID().toString().replaceAll("-","").substring(0,2);
		obj.setMerchantTradeNo("TEST"+testNo+OID.getOrderID());	
		orders.setOrderID(OID.getOrderID());
		
		String form = all.aioCheckOut(obj, null);
			
		return form;
		
	}
//	String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
	
	
	@PostMapping("/orderecpayresponse")
	public String ecpayCheckoutresponse(Orders orders,@RequestParam(name="orderID") Integer orderID) {
		Orders ordersID = oService.findOrdersById(orderID);		
		ordersID.setPaymentStatus("已付款");
		ordersRepo.save(ordersID);
		return "/orders/paymentsuccess";
	}
}
