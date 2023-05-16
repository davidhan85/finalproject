package com.team5.finalTopic.model.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MainArticlesRepository extends JpaRepository<MainArticles, Integer>{

	Page<MainArticles> findByCategory(String category, Pageable pgb);

	
	@Query("SELECT m FROM MainArticles m WHERE m.title LIKE %:searchTerm%")
    public List<MainArticles> findByTitleContaining(@Param("searchTerm") String searchTerm);
	
	
//	@Query("from MainArticles where category = :category")
//	public List<MainArticles> findByMainArticlesCategory(@Param(value = "category") String category,Sort sort);
//	
//	@Query("SELECT COUNT(ma) FROM MainArticles ma WHERE ma.category = :category")
//	Long countByCategory(@Param("category") String category);

}
