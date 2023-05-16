package com.team5.finalTopic.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.MainArticleLikes;
import com.team5.finalTopic.model.board.MainArticleLikesRepository;
import com.team5.finalTopic.model.board.SubArticleLikes;
import com.team5.finalTopic.model.board.SubArticleLikesRepository;

@Service
public class LikesService {
	@Autowired
	private MainArticleLikesRepository malRepository;
	@Autowired
	private SubArticleLikesRepository salRepository;
	
	
	public void addMainArticleLike(MainArticleLikes mal) {
		malRepository.save(mal);
	}
	public void addSubArticleLike(SubArticleLikes sal) {
		salRepository.save(sal);
	}
	
	public Integer getMainArticleLikeCount(Integer mainid) {
	    List<MainArticleLikes> likesList = malRepository.findByMainarticlesformalk_mainid(mainid);
	    System.out.println(likesList.size());
	    return likesList.size();
	}
	
	public Integer getSubArticleLikeCount(Integer subid) {
		List<SubArticleLikes> likesList = salRepository.findBySubarticlesforsalk_subid(subid);
		System.out.println(likesList.size());
		return likesList.size();
	}

	public List<MainArticleLikes> findAllLikesByMainid(Integer mainid) {
		List<MainArticleLikes> likesList = malRepository.findByMainarticlesformalk_mainid(mainid);
		return likesList;
	}
	public List<SubArticleLikes> findAllLikesBySubid(Integer subid) {
		List<SubArticleLikes> likesList = salRepository.findBySubarticlesforsalk_subid(subid);
		return likesList;
	}

}
