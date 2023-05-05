package com.team5.finalTopic.model.Activity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface MultiMemberRepository extends JpaRepository<MultiMember, Integer>{
	 @Query(value="select * from MultiMember where member_number = :member_number", nativeQuery = true)
	 List<MultiMember> findDataByMemberNumber(Integer member_number);
}
