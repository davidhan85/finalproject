package com.team5.finalTopic.controller.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.board.LikesDTO;
import com.team5.finalTopic.model.board.MainArticleLikes;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.board.SubArticleLikes;
import com.team5.finalTopic.model.board.SubArticles;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.board.LikesService;
import com.team5.finalTopic.service.board.MainArticleService;
import com.team5.finalTopic.service.board.SubArticleService;
import com.team5.finalTopic.service.member.MemberService;

@Controller
public class LikesController {

	@Autowired
	private MainArticleService maService;
	@Autowired
	private SubArticleService saService;
	@Autowired
	private MemberService memService;
	@Autowired
	private LikesService lkService;
	
	
	
	@ResponseBody
	@PostMapping("/board/addMainArticleLike")
	public LikesDTO addMainArticleLike(@RequestBody LikesDTO likesdto) {
		MainArticles ma = maService.findMainArticlesById(likesdto.getMainid());
		Member member = memService.findById(likesdto.getAuid());
		MainArticleLikes mal = new MainArticleLikes();
		mal.setAuthoridforMAL(member);
		mal.setMainarticlesformalk(ma);
		lkService.addMainArticleLike(mal);
		LikesDTO likedto = new LikesDTO();
		likedto.setLikeCount(lkService.getMainArticleLikeCount(likesdto.getMainid()));
		return likedto;
	}
	
	
	@ResponseBody
	@PostMapping("/board/showMainArticleLikeAuthors")
	public LikesDTO showMainArticleLikeAuthors(@RequestBody LikesDTO likedto) {
		
		List<MainArticleLikes> mals = lkService.findAllLikesByMainid(likedto.getMainid());
		List<Integer> auidList = new ArrayList<>();
		for (MainArticleLikes mal : mals) {
		    auidList.add(mal.getAuthoridforMAL().getM_number());
		}
		LikesDTO likesdto = new LikesDTO();
		likesdto.setAuidlist(auidList);
		
		return likesdto;
	}
	
	
//	====================回文按讚上傳=========================

	@ResponseBody
	@PostMapping("/board/addSubArticleLike")
	public LikesDTO addSubArticleLike(@RequestBody LikesDTO likesdto) {
		SubArticles sa = saService.findSubArticlesById(likesdto.getSubid());
		Member member = memService.findById(likesdto.getAuid());
		SubArticleLikes sal = new SubArticleLikes();
		sal.setAuthoridforSAL(member);
		sal.setSubarticlesforsalk(sa);
		lkService.addSubArticleLike(sal);
		LikesDTO likedto = new LikesDTO();
		likedto.setLikeCount(lkService.getSubArticleLikeCount(likesdto.getSubid()));
		return likedto;
	}
	
	
	
//	====================回文作者秀出=========================
	
	@ResponseBody
	@PostMapping("/board/showSubArticleLikeAuthors")
	public LikesDTO showSubArticleLikeAuthors(@RequestBody LikesDTO likedto) {
		
		List<SubArticleLikes> sals = lkService.findAllLikesBySubid(likedto.getSubid());
		List<Integer> auidList = new ArrayList<>();
		for (SubArticleLikes sal : sals) {
		    auidList.add(sal.getAuthoridforSAL().getM_number());
		}
		LikesDTO likesdto = new LikesDTO();
		likesdto.setAuidlist(auidList);
		
		return likesdto;
	}
}
