package com.team5.finalTopic.filter;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.team5.finalTopic.model.member.MembernullException;

@Aspect
@Component
public class MemberLoginFilter {
	
	@Autowired
	 HttpSession session;
	
	@Before("@annotation(com.team5.finalTopic.annotation.MemberLogin)")
	public void MemberLoginTag() {
		Object attribute = session.getAttribute("memberbean");
		
		if(attribute==null) {
			throw new MembernullException();
		}
		
	}


}
