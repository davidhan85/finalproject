
package com.team5.finalTopic.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.model.order.OrdersDetail;
import com.team5.finalTopic.service.order.OrdersDetailService;


@Controller
public class OrdersDetailController{
	
	

	@Autowired
	private OrdersDetailService oDetailService;
	
	@GetMapping("/OrdersDetail/add")
	public String addOrdersDetail(Model model) {
		model.addAttribute("OrdersDetail", new OrdersDetail());
		return "orders/addOrdersDetailPage";		
	}
	
	
	@PostMapping("/OrdersDetail/post")
	public String postOrdersDetail(@ModelAttribute("OrdersDetail") OrdersDetail ord,Model model) {
		oDetailService.addOrdersDetail(ord);		
		model.addAttribute("orders", new Orders());
//		OrdersDetail latest = oDetailService.getLatest();
//		model.addAttribute("latest", latest);
		
		return "orders/showOrdersuccess";
	}
	
	@GetMapping("/OrdersDetail")
	public String goShowOrders(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<OrdersDetail> page = oDetailService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		
		return "orders/showOrderDetail";
	}
	
	@GetMapping("/OrdersDetail/edit")
	public String editPage(@RequestParam("id") Integer id,Model model) {
		OrdersDetail ord = oDetailService.findOrdersDetailById(id);
		
		model.addAttribute("orders", ord);
		
		return "orders/editOrdersDetailPage";
	}
	
	@PutMapping("/OrdersDetail/edit")
	public String putEditedOrdersDetail(@ModelAttribute("OrdersDetail") OrdersDetail ord) {
		oDetailService.updateOrdersDetailById(ord.getId(), ord.getProductName());
		return "redirect:/orders";
	}
	
	@DeleteMapping("/OrdersDetail/delete")
	public String deleteOrdersDetail(@RequestParam Integer id) {
		oDetailService.deleteOrdersDetailById(id);
		return "redirect:/orders";
	}

	 @GetMapping("/OrdersDetail/{orderId}")
	    public String getOrderDetails(@PathVariable("orderId") Integer orderId,Model model) {
		 System.out.println(orderId);
	        List<OrdersDetail> ordersDetail = oDetailService.findAllOrdersDetailById(orderId);
	        
	        model.addAttribute("ordersDetails",ordersDetail);
	        System.out.println("return");
	        System.out.println(ordersDetail);
	        return "orders/showOrderDetail";
	    }
	
}