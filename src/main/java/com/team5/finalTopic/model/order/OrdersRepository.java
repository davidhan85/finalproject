package com.team5.finalTopic.model.order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface OrdersRepository extends JpaRepository<Orders, Integer> {


	public Orders findFirstByOrderByCreatedTimeDesc();
	
	
	@Query(value="select * from Orders where member_number=:memberNumber", nativeQuery=true)
	 Page<Orders> findByMemberM_number(@Param(value="memberNumber") Integer memberNumber, Pageable pageable);

//	Optional<Orders> findByOrderNo(String OrderNo);

}
//    Optional<Orders> findByOrderNoIgnoreCase(String OrderNo);
//    Page<Orders> findAllByMemberBean(MemberBean memberBean, Pageable pageable);
//
//    Page<Orders> findAllByOrderStatusAndMemberBean(OrderStatus status, MemberBean memberBean, Pageable pageable);
