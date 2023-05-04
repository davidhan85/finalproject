package com.team5.finalTopic.service.board;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.board.MainArticlesRepository;

@Service
public class MainArticleService {

	@Autowired
	private MainArticlesRepository maRepository;

	@Transactional
	public Page<MainArticles> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "createdatetime");
		Page<MainArticles> page = maRepository.findAll(pgb);
		return page;
	}
	
	@Transactional
	public Page<MainArticles> findByCategory(String category, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "createdatetime");
		List<MainArticles> articles = maRepository.findByCategory(category, pgb.getSort());
		
		Page<MainArticles> page = new PageImpl<>(articles, pgb, articles.size());
		return page;
	}
	
	

	public void addMainArticle(MainArticles ma) {
		maRepository.save(ma);
	}

	public MainArticles findMainArticlesById(Integer id) {
		Optional<MainArticles> option = maRepository.findById(id);

		if (option.isEmpty()) {
			return null;
		}

		return option.get();
	}

	public void deleteMainArticleById(Integer id) {
		maRepository.deleteById(id);
	}

	public Page<MainArticles> findMAByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "updatedatetime");
		Page<MainArticles> page = maRepository.findAll(pgb);

		return page;
	}

	@Transactional
	public MainArticles updateMainById(Integer id, String newContent, String newTitle, String newCategory,
			String newAccess) {
		Optional<MainArticles> option = maRepository.findById(id);

		if (option.isPresent()) {
			MainArticles ma = option.get();
			ma.setTitle(newTitle);
			ma.setContent(newContent);
			ma.setCategory(newCategory);
			ma.setAccess(newAccess);
			return ma;
		}
		return null;
	}
}
