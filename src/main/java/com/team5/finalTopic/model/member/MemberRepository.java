package com.team5.finalTopic.model.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<Member, Integer> {

        @Query("from Member  where m_account=:m_account")
     boolean existsByM_account(@Param(value="m_account")String m_account);

        @Query("from Member  where m_account=:m_account" )
        Member findByM_account(@Param(value="m_account")String m_account);
//
//    void deleteById(Integer mNumber);

        @Query("from Member  where m_email=:m_email" )
		Member findByM_email(@Param(value = "m_email") String m_email);
        
      
}
