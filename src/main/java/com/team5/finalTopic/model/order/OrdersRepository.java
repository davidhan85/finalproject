package com.team5.finalTopic.model.order;
import org.springframework.data.jpa.repository.JpaRepository;



public interface OrdersRepository extends JpaRepository<Orders, Integer> {


	public Orders findFirstByOrderByCreatedTimeDesc();
	
	
//	Optional<Orders> findByOrderNo(String OrderNo);

}
//    Optional<Orders> findByOrderNoIgnoreCase(String OrderNo);
//    Page<Orders> findAllByMemberBean(MemberBean memberBean, Pageable pageable);
//
//    Page<Orders> findAllByOrderStatusAndMemberBean(OrderStatus status, MemberBean memberBean, Pageable pageable);
