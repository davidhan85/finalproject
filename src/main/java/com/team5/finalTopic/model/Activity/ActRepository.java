package com.team5.finalTopic.model.Activity;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;




public interface ActRepository extends JpaRepository<Activity, Integer>{
//	
//	@Query("from Activity where activity_name = :activity_name")//HQL，這裡的Customer是Entity是對應到Customer.java的public class Customer，Entity事物件想像成是轉運站，可以真正的影響到我們的資料庫
//	public List<Activity> findByActivity_name(@Param(value="name") String activity_name);
	
	
//            + " OR p.activity_name LIKE %?我%")    
	@Query("FROM Activity p WHERE p.activity_name LIKE %:keyword%")
	public List<Activity> search(@Param("keyword") String keyword);

}
