package com.team5.finalTopic.service.order;

import org.springframework.data.domain.Page;

import com.team5.finalTopic.model.order.Orders;


public interface OrdersServ{
	
	
	public void addOrders(Orders ord);
	
	public Orders findOrdersById(Integer id);
	
	public void deleteOrdersById(Integer id);
	
	public Page<Orders> findByPage(Integer pageNumber);
	
	public Orders updateById(Integer id, String newOrd);
	
	public Orders getLatest();

	Orders updateOrders(Orders orders);
}
