package com.team5.finalTopic.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class MemberServiceImpl  implements MemberService{

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public List<Member> findAll() {
        return memberRepository.findAll();
    }

    @Override
    public void save(Member member) {
    BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
    if (member.getM_number()!=null){//修改時
    String oldpwd=memberRepository.findById(member.getM_number()).get().m_password;
    if (member.getM_password().equals(oldpwd)){//有修改密碼
    member.setM_password(passwordEncoder.encode(member.getM_password()));
    }else {
        member.setM_password(passwordEncoder.encode(member.getM_password()));
    }

    }
    memberRepository.save(member);
    }

    //專門為重設密碼專用
    @Override
    public void save(Member member, String newpwd) {
        BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
        member.setM_password(passwordEncoder.encode(member.getM_password()));
    }

    @Override
    public Member findById(Integer m_number) {
        return memberRepository.findById(m_number).get();
    }

    @Override
    public void deleteById(Integer m_number) {
        memberRepository.deleteById(m_number);
    }
    @Override
    public Boolean existsByMiAccount(String m_account) {

        return memberRepository.existsByMiAccount(m_account);
    }

    @Override
    public Member findByAccount(String m_account) {
//        Member account = memberRepository.findByAccount(m_account);
        return memberRepository.findByAccount(m_account);
    }

    @Override
    public Member savePictureInDB(Member member, Boolean isInsert) {

        return null;
    }


}
