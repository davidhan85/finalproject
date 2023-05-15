package com.team5.finalTopic.model.board;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubArticlesRepository extends JpaRepository<SubArticles, Integer> {

	
//	@Query("from SubArticles where fk_SA_MA_Id = :fk_SA_MA_Id")
//	public List<SubArticles> findSubArticlesBymainid(@Param(value = "fk_SA_MA_Id") Integer mainid,Sort sort);
//
//
//	@Query("SELECT COUNT(sa) FROM SubArticles sa WHERE sa.mainarticlesforsa.mainid = :mainid")
//	Long countSubArticlesBymainid(@Param("mainid") Integer mainid);


	Page<SubArticles> findByMainarticlesforsa_mainid(Integer mainid, Pageable pgb);


}
