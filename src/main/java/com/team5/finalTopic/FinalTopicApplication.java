package com.team5.finalTopic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.team5.finalTopic"})
public class FinalTopicApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalTopicApplication.class, args);
	}

}
