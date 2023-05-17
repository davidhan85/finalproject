package com.team5.finalTopic.service.order;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.model.order.OrdersDetail;
import com.team5.finalTopic.model.order.OrdersDetailRepository;


@Service
public class OrdersDetailService implements OrdersDetailServ{
	@Autowired
	private OrdersDetailRepository ordDetailRepository;
	
	@Override
	public void addOrdersDetail(OrdersDetail ord) {
		ordDetailRepository.save(ord);
		
	}
	
	@Override
	public OrdersDetail findOrdersDetailById(Integer id) {
		Optional<OrdersDetail> option = ordDetailRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	
	@Override
	public void deleteOrdersDetailById(Integer id) {
		ordDetailRepository.deleteById(id);
	}
	
	@Override
	@Transactional
	public OrdersDetail updateOrdersDetailById(Integer id, String newOrdDetail) {
		Optional<OrdersDetail> option = ordDetailRepository.findById(id);		
		if(option.isPresent()) {
			OrdersDetail ordDetail = option.get();
			ordDetail.setProductName(newOrdDetail);
			return ordDetail;
		}
		return null;
	}
	
	@Override
	public Page<OrdersDetail> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "orderID");
		Page<OrdersDetail> page = ordDetailRepository.findAll(pgb);
		return page;
	}
	
	@Override
	public  List<OrdersDetail> findAllOrdersDetailById(Integer orderId){
		
		return ordDetailRepository.findAllOrdersDetailByorderId(orderId);
		
	}
//	return ordDetailRepository.findFirstByOrderByIDDesc();
//	}
}
