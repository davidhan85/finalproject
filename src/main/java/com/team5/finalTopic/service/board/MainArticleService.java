package com.team5.finalTopic.service.board;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.model.board.MainArticleMessagesRepository;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.board.MainArticlesRepository;
import com.team5.finalTopic.model.board.SubArticles;
import com.team5.finalTopic.model.board.SubArticlesRepository;

@Service
public class MainArticleService {

	@Autowired
	private MainArticlesRepository maRepository;

	@Autowired
	private SubArticlesRepository saRepository;

	@Autowired
	private MainArticleMessagesRepository mamRepository;
	
	@Transactional
	public Page<MainArticles> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "createdatetime");
		Page<MainArticles> page = maRepository.findAll(pgb);
		return page;
	}

	@Transactional
	public Page<MainArticles> findByCategory(String category, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "createdatetime");
//		List<MainArticles> articles = maRepository.findByMainArticlesCategory(category, pgb.getSort());
//		Long totalArticles = maRepository.countByCategory(category);
//		// 判斷是否是最後一頁
//				if (pageNumber == totalArticles / 5 + 1) {
//					int lastPageCount = totalArticles.intValue() % 5;
//					if (lastPageCount > 0 && articles.size() > lastPageCount) {
//						// 移除重複的那筆資料
//						articles.remove(lastPageCount);
//					}
//				}
		Page<MainArticles> page = maRepository.findByCategory(category, pgb);
		return page;
	}

	@Transactional
	public Page<SubArticles> findSubByPage(Integer mainid, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.ASC, "createdatetime");
		Page<SubArticles> page = saRepository.findByMainarticlesforsa_mainid(mainid, pgb);
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
	
	
	//==============================新增回文===========================
	public void addSubArticle(SubArticles sa) {
		saRepository.save(sa);
	}

	public SubArticles findSubArticlesById(Integer id) {
		Optional<SubArticles> option = saRepository.findById(id);

		if (option.isEmpty()) {
			return null;
		}

		return option.get();
	}
	//==============================主文章載入、刪除既有留言====================
	
	public List<MainArticleMessages> findMainArticleMessagesByMainarticlesformam_mainid(Integer mainid){
		List<MainArticleMessages> mams = mamRepository.findAllByMainarticlesformam_mainid(mainid);
		return mams;
	}
	
	public void deleteMainArticleMessages(Integer mamid) {
		mamRepository.deleteById(mamid);
	}
	
	
}
