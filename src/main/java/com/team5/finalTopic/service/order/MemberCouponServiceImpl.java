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
import com.team5.finalTopic.model.order.MemberCoupon;
import com.team5.finalTopic.model.order.MemberCouponRepository;
import com.team5.finalTopic.model.order.OrdersDetail;


@Service
public class MemberCouponServiceImpl implements MemberCouponService{
	
	@Autowired
	private MemberCouponRepository membercouRepository;
	
	@Override
	public void addMemberCoupon(MemberCoupon mcou) {
		membercouRepository.save(mcou);
		
	}
	
	@Override
	public MemberCoupon findMemberCouponById(Integer id) {
		Optional<MemberCoupon> option = membercouRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	
	@Override
	public void deleteMemberCouponById(Integer id) {
		membercouRepository.deleteById(id);
	}
	
	@Override
	@Transactional
	public MemberCoupon updateMemberCouponById(Integer id, String newcou) {
		Optional<MemberCoupon> option = membercouRepository.findById(id);		
		if(option.isPresent()) {
			MemberCoupon cou = option.get();
			cou.setCoupon_id(newcou);
			return cou;
		}
		return null;
	}
	
	@Override
	public Page<MemberCoupon> findByPage(Integer pageNumber){	
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "MemberCouponID");
		Page<MemberCoupon> page = membercouRepository.findAll(pgb);
		return page;
	}
	
//	@Override
//	public MemberCoupon getLatest() {
//	return membercouRepository.findFirstByOrderByMemberCouponIDDesc();
//	}
}
