package com.team5.finalTopic.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.model.board.MainArticleMessagesRepository;

@Service
public class MainArticleMessageService {

	@Autowired
	private MainArticleMessagesRepository mamRepository ;
	
	public void addMainArticleMessages(MainArticleMessages ma) {
		mamRepository.save(ma);
	}
	
	public Page<MainArticleMessages> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "createdatetime");
		Page<MainArticleMessages> page = mamRepository.findAll(pgb);
		return page;
	}
}
