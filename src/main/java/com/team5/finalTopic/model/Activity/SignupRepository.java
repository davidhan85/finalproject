package com.team5.finalTopic.model.Activity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface SignupRepository extends  JpaRepository<SignUp, Integer>{

//	SignUp findFirstByOrderByAddedDesc();

	 @Query(value="select * from SignUp where member_number = :member_number", nativeQuery = true)
	 List<SignUp> findSignupByMemberNumber(Integer member_number);

	 @Query(value="select * from SignUp where paystatus = :paystatus", nativeQuery = true)
	List<SignUp> findByPaystatus(String paystatus);
	

}
