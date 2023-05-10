package com.team5.finalTopic.model.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	//抓出來的資料為Member物件
        @Query("from Member  where m_account=:m_account")
     Member existsByM_account(@Param(value="m_account")String m_account);

        @Query("from Member  where m_account=:m_account" )
        Member findByM_account(@Param(value="m_account")String m_account);
//
//    void deleteById(Integer mNumber);

        @Query("from Member  where m_email=:m_email" )
		Member findByM_email(@Param(value = "m_email") String m_email);
        
        @Query("from Member  where m_verify=:m_verify")
        Member findByM_verify(@Param(value = "m_verify") String m_verify);
        
      
}
