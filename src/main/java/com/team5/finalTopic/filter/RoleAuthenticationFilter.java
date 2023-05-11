package com.team5.finalTopic.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.team5.finalTopic.model.member.Member;

@Component
public class RoleAuthenticationFilter extends OncePerRequestFilter  {
       
	private static final String ADMIN_ROLE ="admin";
	private static final String User_RoLE="user";
	
	@Override
	public void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		Member member=(Member) request.getSession().getAttribute("memberbean");
		String role= member.getM_Role();
		System.out.println(role);
		String path=request.getRequestURI();
		System.out.println("啟動");	
		System.out.println("現在的path是"+path);
		 if (role != null && role.equals(ADMIN_ROLE)) {
	            // 只有角色為"admin"的使用者才可以進入CMS
	            filterChain.doFilter(request, response);
	        } else {
	            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	        }
	 		
	}
}
