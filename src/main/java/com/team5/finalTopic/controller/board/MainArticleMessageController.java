package com.team5.finalTopic.controller.board;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team5.finalTopic.model.board.MainArticleMessageDTO;
import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.board.MainArticleMessageService;
import com.team5.finalTopic.service.board.MainArticleService;

@Controller
public class MainArticleMessageController {

	@Autowired
	private MainArticleMessageService mamService;

	@Autowired
	private MainArticleService maService;

	@Autowired
	private com.team5.finalTopic.service.member.MemberService MemberService;

	@ResponseBody
	@PostMapping("/board/mainArticleMessages")
	public List<MainArticleMessageDTO> postMessageApi(@RequestBody MainArticleMessageDTO mamdto)
			throws JsonProcessingException {
		System.out.println("xxxx" + mamdto);
		Member member = MemberService.findById(mamdto.getAuid());
		MainArticles ma = maService.findMainArticlesById(mamdto.getMainid());
		MainArticleMessages msg = new MainArticleMessages();

		msg.setAuthoridforMAM(member);
		msg.setMainarticlesformam(ma);
		msg.setContent(mamdto.getContent());
		mamService.addMainArticleMessages(msg);

		List<MainArticleMessages> mams = mamService.findMainArticleMessages(mamdto.getMainid());
		List<MainArticleMessageDTO> mamsDTO = mams.stream()
			    .map(mam -> {
			        MainArticleMessageDTO mamDTO = new MainArticleMessageDTO();
			        mamDTO.setUpdatedatetime(mam.getUpdatedatetime());
			        mamDTO.setAuid(mam.getAuthoridforMAM().getM_number());
			        mamDTO.setContent(mam.getContent());
			        return mamDTO;
			    })
			    .collect(Collectors.toList());

		System.out.println("xxx" + mamsDTO);
		return mamsDTO;
	}
}