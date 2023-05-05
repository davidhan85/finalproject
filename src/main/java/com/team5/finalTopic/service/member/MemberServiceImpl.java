package com.team5.finalTopic.service.member;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
@Transactional
public class MemberServiceImpl  implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public List<Member> findAll() {
        return memberRepository.findAll();
    }

    @Override
    public void save(Member member) {
    //BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
    if (member.getM_number()!=null){//修改時
//        Optional<Member> optionalMember = memberRepository.findById(member.getM_number());
//        System.out.println(optionalMember);
    String oldpwd=memberRepository.findById(member.getM_number()).get().getM_password();
//    System.out.println(oldpwd);
//    System.out.println(member.getM_password());
    if (!member.getM_password().equals(oldpwd)){//有修改密碼
    member.setM_password((member.getM_password()));
    }else {
        member.setM_password((oldpwd));
    }

    }
    memberRepository.save(member);
    }

    //專門為重設密碼專用
    @Override
    public void save(Member member, String newpwd) {
       // BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
        member.setM_password((member.getM_password()));
    }

    @Override
    public Member findById(Integer m_number) {
        return memberRepository.findById(m_number).get();
    }

    @Override
    public void updateNoEncoding(Member member) {
        if (member.getM_number()!=null){ //修改但沒更改密碼時
            memberRepository.save(member);
        }
    }

    @Override
    public void deleteById(Integer m_number) {
        memberRepository.deleteById(m_number);
    }

    @Override
    public Member findByM_account(String m_account) {
        return memberRepository.findByM_account(m_account);
    }
    
    //把抓出來的account轉成Boolen傳回去
    @Override
    @ResponseBody
    public Boolean existsByM_account(String m_account) {
        return memberRepository.existsByM_account(m_account)!=null;
    }



    @Override
    public Member savePictureInDB(Member member, Boolean isInsert) {
        MultipartFile picture = member.getProductImage(); //取得 MultipartFile
        if(picture!=null){
            try {
                byte[] b = picture.getBytes();
//                Blob blob = new SerialBlob(b); //塞進blob
                member.setM_image(b);
                //建立唯一的圖片名稱
                member.setFilename(System.currentTimeMillis()+"_"+picture.getOriginalFilename());
                return member;
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳異常"+e.getMessage());
            }
        }else {
            //如果更改時沒有上傳圖片
            if (!isInsert){ //沒更改時
                try {
                    member.setM_image(findById(member.getM_number()).getM_image());//找舊的圖片
                    member.setFilename(findById(member.getM_number()).getFilename());//找舊的檔名
                    return member;

                }catch (Exception e){
                    e.printStackTrace();
                    throw new RuntimeException("修改時圖片上船異常"+e.getMessage());
                }
            }
        }
        return member;
    }

    @Override
    public byte[] getMemberImage(Integer m_number) {
        Optional<Member> option =memberRepository.findById(m_number);
        if(option.isPresent()) {
            Member member=option.get();
            return member.getM_image();
        }else {
            return null;
        }


    }
}
