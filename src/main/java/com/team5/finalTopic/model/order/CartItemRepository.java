package com.team5.finalTopic.model.order;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.member.Member;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	
	
	public List<CartItem> findByMember(Member member);

	public void save(ListedProduct lp); 
	
	@Query(value="select * from CartItem where member_number=:cartItemID", nativeQuery=true)
	public List<CartItem> findAllByMember(@Param(value="cartItemID") Integer member);
	

	@Query(value = "DELETE FROM CartItem WHERE id = :cartItemID", nativeQuery = true)
	void deleteCartItemById(@Param("cartItemID") Integer id);
	
	

}
