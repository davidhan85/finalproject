package com.team5.finalTopic.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.SubArticleMessages;
import com.team5.finalTopic.model.board.SubArticleMessagesRepository;

@Service
public class SubArticleMessageService {
	
	@Autowired
	private SubArticleMessagesRepository samRepository ;
	
	public void addSubArticleMessages(SubArticleMessages sa) {
		samRepository.save(sa);
	}
	
public List<SubArticleMessages> findSubArticleMessages(Integer subid ){
		
		List<SubArticleMessages> sam = samRepository.findAllBySubarticlesforsam_subid(subid);
		
		return sam;
}
}