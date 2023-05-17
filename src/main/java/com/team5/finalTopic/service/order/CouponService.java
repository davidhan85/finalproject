package com.team5.finalTopic.service.order;

import org.springframework.data.domain.Page;

import com.team5.finalTopic.model.order.Coupon;


public interface CouponService {


	public void addCoupon(Coupon cou);
	
	public Coupon findCouponById(Integer id);
	
	public void deleteCouponById(Integer id);

	public Coupon updateCouponById(Integer id, String newcou);
	
	public Page<Coupon> findByPage(Integer pageNumber);
	
	public Coupon getLatest();
}
