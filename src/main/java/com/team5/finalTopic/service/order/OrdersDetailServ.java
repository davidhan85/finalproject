package com.team5.finalTopic.service.order;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.team5.finalTopic.model.order.OrdersDetail;


public interface OrdersDetailServ{
	
	
	public void addOrdersDetail(OrdersDetail ord);
	
	public OrdersDetail findOrdersDetailById(Integer id);
	
	public void deleteOrdersDetailById(Integer id);

	public OrdersDetail updateOrdersDetailById(Integer id, String newOrdDetail);
	
	public Page<OrdersDetail> findByPage(Integer pageNumber);
	
	public  List<OrdersDetail> findAllOrdersDetailById(Integer orderId);
//	public OrdersDetail getLatest();
}
