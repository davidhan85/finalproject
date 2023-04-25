package com.team5.finalTopic.controller.login;

import com.team5.finalTopic.model.login.LoginRepository;
import com.team5.finalTopic.service.login.LoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private LoginServiceImpl LoginService;

    @GetMapping(value = "/Login")
    public String goLoginPage(){
        return "Login/Loginpage";
    }












}
