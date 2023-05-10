package com.team5.finalTopic.service.member;

import java.util.List;

import com.team5.finalTopic.model.member.Member;


public interface MemberService {
    //show all
    public List<Member> findAll();

    //save
    public void save(Member member);

    //前台重設密碼用
    public void frontSave(Member member, String newpwd);

    //用id找會員
    public  Member findById(Integer m_number);

    public void updateNoEncoding(Member member);

    //刪除
    public void deleteById(Integer m_number);
    
    //找email
    public Member findByM_email(String m_email);

    //檢查資料庫內是否已經有此帳號
    public Boolean existsByM_account(String m_account);

    public Member findByM_account(String m_account);
    
    public Member findByM_verify(String m_verify);

    //把大頭貼存進資料庫
    public Member savePictureInDB(Member member,Boolean isInsert);
    
    //再查詢頁面抓出圖片
    public byte[] getMemberImage(Integer m_number);





}
