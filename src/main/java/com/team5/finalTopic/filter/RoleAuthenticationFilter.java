package com.team5.finalTopic.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class RoleAuthenticationFilter extends OncePerRequestFilter  {
       
	private static final String ADMIN_ROLE ="admin";
	private static final String User_RoLE="user";
	
	@Override
	public void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String role=request.getParameter("m_Role");
		System.out.println(role);
		String path=request.getRequestURI();
		System.out.println("啟動");	
		System.out.println("現在的path是"+path);
		if(role==null) {
			filterChain.doFilter(request, response);
			return;
		}else {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		}
		if(role.equals(ADMIN_ROLE)) {
			filterChain.doFilter(request, response);
		}else {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		}
		
		if(path.equals("finalTopic_5/CMS")&&role!="admin") {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		
	}
}
