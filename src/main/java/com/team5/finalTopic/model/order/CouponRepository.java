package com.team5.finalTopic.model.order;

import org.springframework.data.jpa.repository.JpaRepository;


public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	public Coupon findFirstByOrderByCouponEnableTimeDesc();
}
