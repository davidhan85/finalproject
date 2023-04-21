package com.team5.finalTopic.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShowMainArticleController {

	@GetMapping("/board")
	public String showMainArticles() {
		return "/board/ShowMainArticles";
	}
}
