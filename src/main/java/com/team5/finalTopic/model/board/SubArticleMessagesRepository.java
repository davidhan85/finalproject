package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface SubArticleMessagesRepository extends JpaRepository<SubArticleMessages, Integer> {

	 List<SubArticleMessages> findSubArticleMessagesBySubarticlesforsam_subid(Integer subArticleId);

	 List<SubArticleMessages> findAllBySubarticlesforsam_subid(Integer subid);
}
