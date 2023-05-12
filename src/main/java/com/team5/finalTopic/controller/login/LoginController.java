package com.team5.finalTopic.controller.login;

import com.team5.finalTopic.model.login.LoginRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;
import com.team5.finalTopic.service.login.LoginServiceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
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
    
    @Autowired
    private MemberRepository memberRepository;

    @GetMapping(value = "/Login")
    public String goLoginPage(HttpServletRequest request){
    	String referer=request.getHeader("Referer");
    	request.getSession().setAttribute("url", referer);
        return "Login/Loginpage";
    }
    @PostMapping(value = "/checkLogin")
    public String checkLogin(@RequestParam("username")String username,@RequestParam("pwd") String pwd, Model model,
    		HttpSession session,HttpServletRequest request) {
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

        Member memberexisted = loginService.findByM_accountAndM_password(username, pwd);
        if (memberexisted!=null){
        	if(memberexisted.getM_status().equals("success")) {
        		 System.out.println("登入");
                 session.setAttribute("memberbean", memberexisted);
                 model.addAttribute("account",username);
                 model.addAttribute("pwd",pwd);
                String url =(String) request.getSession().getAttribute("url");
                if(url!=null) {
                	session.removeAttribute("url");
                	return "redirect:"+url;
                }
                 return "redirect:/home";
        	}
        	error.put("msgg", "尚未註冊請先註冊");
        	 return "Login/Loginpage";
//            System.out.println("登入");
//            session.setAttribute("memberbean", memberexisted);
//            model.addAttribute("account",username);
//            model.addAttribute("pwd",pwd);
//            return "redirect:/home";
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

        return "member/membercenter2";
    }

}
