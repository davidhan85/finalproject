package com.team5.finalTopic.filter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team5.finalTopic.model.member.MembernullException;

@ControllerAdvice
public class MemberLoginexceptionhander {

	@ExceptionHandler(MembernullException.class)
	public String MemberLoginhander(RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addFlashAttribute("msg","您還沒登入,請先登入");
		return "redirect:/Login";
		
	}
	
}
