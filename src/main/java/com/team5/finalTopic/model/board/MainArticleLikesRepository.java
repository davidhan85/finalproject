package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MainArticleLikesRepository extends JpaRepository<MainArticleLikes, Integer> {

	List<MainArticleLikes> findByMainarticlesformalk_mainid(Integer mainid);

	

}
