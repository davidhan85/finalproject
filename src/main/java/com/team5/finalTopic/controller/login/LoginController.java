package com.team5.finalTopic.controller.login;

import com.team5.finalTopic.model.login.LoginRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.login.LoginServiceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
    private LoginServiceImpl loginService;

    @GetMapping(value = "/Login")
    public String goLoginPage(){
        return "Login/Loginpage";
    }
    @PostMapping(value = "/checkLogin")
    public String checkLogin(@RequestParam("username")String username,@RequestParam("password") String pwd, Model model,HttpSession session) {
        Map<String,String>error=new HashMap<String,String>();
        model.addAttribute("error",error);
        System.out.println(username);
        System.out.println(pwd);
        if(username==null||username.length()==0) {
            error.put("account","帳號不能為空");
        }
        if (pwd==null||pwd.length()==0){
            error.put("pwd","密碼不能為空");
        }
//        if (error!=null){
//            System.out.println("錯誤");
//            return "Login/Loginpage";
//        }
        Member memberexisted = loginService.findByM_accountAndM_password(username, pwd);
        if (memberexisted!=null){
            System.out.println("登入");
            session.setAttribute("memberbean", memberexisted);
            model.addAttribute("account",username);
            model.addAttribute("pwd",pwd);
            return "redirect:/home";
        }
        error.put("msg","請輸入正確的帳號跟密碼");
        return "Login/Loginpage";
    }
    @GetMapping(value = "/checkout")
    public String Loginout(HttpSession session) {
    	session.removeAttribute("memberbean");
		return "index";
    	
    }
    @GetMapping(value = "/membercenter")
    public String MemberCenter(){

        return "member/membercenter";
    }

}
