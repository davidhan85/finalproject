package com.team5.finalTopic.controller.login;

import com.team5.finalTopic.model.login.LoginRepository;
import com.team5.finalTopic.service.login.LoginServiceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @PostMapping(value = "/checkLogin")
    public String checkLogin(@RequestParam("username")String username,@RequestParam("password") String pwd, Model model) {
    	Map<String,String>error=new HashMap<String,String>();
    	model.addAttribute("error",error);
    	if(username==null||username.length()==0) {
    		
    		
    	}
		return null;
    	
    }
    












}
