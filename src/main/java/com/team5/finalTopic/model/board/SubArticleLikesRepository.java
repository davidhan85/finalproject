package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SubArticleLikesRepository extends JpaRepository<SubArticleLikes, Integer > {

	SubArticleLikes findSubArticleLikesBySubarticlesforsalk_subid(Integer id);

	List<SubArticleLikes> findBySubarticlesforsalk_subid(Integer subid);
	
}
