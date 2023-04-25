package com.team5.finalTopic.model.login;

import com.team5.finalTopic.model.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LoginRepository extends JpaRepository<Member, Integer> {


    @Query("SELECT m FROM Member m WHERE m.m_account = ?1 AND m.m_password = ?2")
    public Member findByM_accountAndM_password(String m_account, String m_password);
}
