package com.team5.finalTopic.service.order;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.order.Orders;
import com.team5.finalTopic.model.order.OrdersRepository;


@Service
public class OrdersService implements OrdersServ{
	@Autowired
	private OrdersRepository ordRepository;
	
	public void addOrders(Orders ord) {
		ordRepository.save(ord);
		
	}
	
	@Override
	public Orders findOrdersById(Integer id) {
		Optional<Orders> option = ordRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	@Override
	public void deleteOrdersById(Integer id) {
		ordRepository.deleteById(id);
	}
	@Override
	public Page<Orders> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "orderID");
		Page<Orders> page = ordRepository.findAll(pgb);
		return page;
	}
	@Override
	@Transactional
	public Orders updateById(Integer id, String newOrd) {
		Optional<Orders> option = ordRepository.findById(id);		
		if(option.isPresent()) {
			Orders ord = option.get();
			ord.setOrderNo(newOrd);
			return ord;
		}
		return null;
	}
	@Override
	public Orders getLatest() {
	return ordRepository.findFirstByOrderByCreatedTimeDesc();
	}

	@Override
	@Transactional
	public Orders updateOrders(Orders orders) {
	    Optional<Orders> optionalOrders = ordRepository.findById(orders.getOrderID());
	    if (optionalOrders.isPresent()) {
	        Orders ord = optionalOrders.get();
	        ord.setOrderNo(orders.getOrderNo());
	        
	        Member member = orders.getMember();
	        int memberNumber = member.getM_number();
	        
	        Member updatedMember = new Member();
	        updatedMember.setM_number(memberNumber);
	        ord.setMember(updatedMember);
	        ord.setBuyerID(orders.getBuyerID());
	        ord.setPaymentMethoderNo(orders.getPaymentMethoderNo());
	        ord.setShippingMethod(orders.getShippingMethod());
	        ord.setCoupon_id(orders.getCoupon_id());
	        return ord;
	    }
	    return null;
	}

	public Page<Orders> findByMemberId(Integer m_number, Integer pageNumber) {
		
		
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "orderID");
		
		return ordRepository.findByMemberM_number(m_number, pgb);		
			
	}
	

	
	
}
