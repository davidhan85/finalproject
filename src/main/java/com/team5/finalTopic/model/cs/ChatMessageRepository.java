package com.team5.finalTopic.model.cs;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface  ChatMessageRepository extends JpaRepository<ChatMessage,Integer> {

//	@Query("select cm from ChatMessage cm where cm.customer.m_number= :CustomerNumber")
//	public List<ChatMessage> findByCustomerNumber(int CustomerNumber);
}
