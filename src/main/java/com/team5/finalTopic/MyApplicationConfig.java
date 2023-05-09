package com.team5.finalTopic;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;

import com.team5.finalTopic.filter.RoleAuthenticationFilter;

@Configuration
public class MyApplicationConfig {
	
	@Bean
	public FilterRegistrationBean<RoleAuthenticationFilter> roleAuthenticationBean(){
		FilterRegistrationBean<RoleAuthenticationFilter> registration=new FilterRegistrationBean<>();
		registration.setFilter(new RoleAuthenticationFilter());
		registration.addUrlPatterns("/finalTopic_5/*");
		registration.setOrder(Ordered.LOWEST_PRECEDENCE);
		return registration;		
	}
}
