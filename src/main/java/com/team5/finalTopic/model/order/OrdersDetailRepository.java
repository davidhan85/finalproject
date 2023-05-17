package com.team5.finalTopic.model.order;

import java.util.List;

import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface OrdersDetailRepository extends JpaRepository<OrdersDetail, Integer> {
//	public OrdersDetail findFirstByOrderByIDDesc();
//	@Query("SELECT MAX(c.crawlerDate) FROM Crawler c WHERE c.product.productId = :id")
	
	@Query(value="SELECT od FROM OrdersDetail od WHERE od.orders.orderID = :OrderId")
    List<OrdersDetail> findAllOrdersDetailByorderId(@Param("OrderId") Integer orderId);
	
}
