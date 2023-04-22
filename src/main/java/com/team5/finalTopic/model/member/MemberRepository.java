package com.team5.finalTopic.model.member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {

    public boolean existsByMiAccount(String m_account);

    public Member findByAccount(String m_account);

    void deleteById(Integer mNumber);
}
