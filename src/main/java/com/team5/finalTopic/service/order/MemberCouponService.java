package com.team5.finalTopic.service.order;

import org.springframework.data.domain.Page;

import com.team5.finalTopic.model.order.MemberCoupon;


public interface MemberCouponService {


	public void addMemberCoupon(MemberCoupon cou);
	
	public MemberCoupon findMemberCouponById(Integer id);
	
	public void deleteMemberCouponById(Integer id);

	public MemberCoupon updateMemberCouponById(Integer id, String newcou);
	
	public Page<MemberCoupon> findByPage(Integer pageNumber);
	
//	public MemberCoupon getLatest();
}
