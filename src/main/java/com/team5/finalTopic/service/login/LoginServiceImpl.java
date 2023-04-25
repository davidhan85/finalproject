package com.team5.finalTopic.service.login;

import com.team5.finalTopic.model.login.LoginRepository;
import com.team5.finalTopic.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class LoginServiceImpl implements LoginService{

    @Autowired
    LoginRepository loginRepository;
    @Override
    public Member findByM_accountAndM_password(String m_account, String m_password) {
        return loginRepository.findByM_accountAndM_password(m_account, m_password);
    }
}
