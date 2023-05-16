package com.team5.finalTopic.service.board;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public List<MainArticleMessages> findMainArticleMessages(Integer mainid ){
		
		List<MainArticleMessages> mam = mamRepository.findAllByMainarticlesformam_mainid(mainid);
		
		return mam;
	}
	
	@Transactional
	public MainArticleMessages updateMainMessageById(Integer id, String newContent) {
		Optional<MainArticleMessages> option = mamRepository.findById(id);

		if (option.isPresent()) {
			MainArticleMessages mam = option.get();
			
			mam.setContent(newContent);
			
			
			return mam;
		}
		return null;
	}
	
	
}
