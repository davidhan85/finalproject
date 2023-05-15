package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MainArticleMessagesRepository extends JpaRepository<MainArticleMessages, Integer> {



	List<MainArticleMessages> findAllByMainarticlesformam_mainid(Integer mainid);

}
