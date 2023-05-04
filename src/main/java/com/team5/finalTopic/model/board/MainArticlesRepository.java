package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MainArticlesRepository extends JpaRepository<MainArticles, Integer>{
	
	
	
	@Query("from MainArticles where category = :category")
	public List<MainArticles> findByMainArticlesCategory(@Param(value = "category") String category);
	
	List<MainArticles> findByCategory(String category,Sort sort);
}
