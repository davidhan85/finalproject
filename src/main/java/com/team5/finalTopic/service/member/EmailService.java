package com.team5.finalTopic.service.member;

import com.team5.finalTopic.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class EmailService {

    private JavaMailSender javaMailSender;

    @Autowired
    public EmailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @ResponseBody
    public  void sendRegistrationConfirmationEmail(Member member , String confirmationUrl){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(member.getM_email());
        System.out.println(message);
        message.setSubject("這裡是書贏遊你來決定的註冊驗證信");
        message.setText("親愛的"+member.getM_account()+",\n\n"+"感謝你註冊我們網站!請典籍以下連結進行認證:\n\n"+confirmationUrl+"\n\n"+"Best regards,\n");
        javaMailSender.send(message);

    }
}
