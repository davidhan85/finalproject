package com.team5.finalTopic.service.login;

import com.team5.finalTopic.model.member.Member;

public interface LoginService {
    //找DB內的帳號密碼
    public Member findByM_accountAndM_password(String m_account, String m_password);
}
