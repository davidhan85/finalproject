package com.team5.finalTopic.service.order;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.order.Coupon;
import com.team5.finalTopic.model.order.CouponRepository;
import com.team5.finalTopic.model.order.OrdersDetail;


@Service
public class CouponServiceImpl implements CouponService{
	
	@Autowired
	private CouponRepository couRepository;
	
	@Override
	public void addCoupon(Coupon cou) {
		couRepository.save(cou);
		
	}
	
	@Override
	public Coupon findCouponById(Integer id) {
		Optional<Coupon> option = couRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	@Override
	public void deleteCouponById(Integer id) {
		couRepository.deleteById(id);
	}
	
	@Override
	@Transactional
	public Coupon updateCouponById(Integer id, String newcou) {
		Optional<Coupon> option = couRepository.findById(id);		
		if(option.isPresent()) {
			Coupon cou = option.get();
			cou.setCoupon_name(newcou);
			return cou;
		}
		return null;
	}
	
	@Override
	public Page<Coupon> findByPage(Integer pageNumber){	
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "coupon_id");
		Page<Coupon> page = couRepository.findAll(pgb);
		return page;
	}
	
	@Override
	public Coupon getLatest() {
	return couRepository.findFirstByOrderByCouponEnableTimeDesc();
	}
}
