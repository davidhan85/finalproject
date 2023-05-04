package com.team5.finalTopic.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.service.board.MainArticleMessageService;

@Controller
public class MainArticleMessageController {

	
	
	@Autowired
	private MainArticleMessageService mamService;
	
	@Transactional 
	@ResponseBody
	@PostMapping("/board/mainArticleMessages")
	public Page<MainArticleMessages> postMessageApi(@RequestBody MainArticleMessages msg){
		
		mamService.addMainArticleMessages(msg);
		
		Page<MainArticleMessages> page = mamService.findByPage(1);
		
		return page;
	}
	

	
}
