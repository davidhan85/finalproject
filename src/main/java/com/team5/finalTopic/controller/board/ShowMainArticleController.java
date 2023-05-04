package com.team5.finalTopic.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.service.board.MainArticleService;

@Controller
public class ShowMainArticleController {

	@Autowired
	private MainArticleService maService;
	
	


	@GetMapping("/board")
	public String ShowMainArticles(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<MainArticles> page = maService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		
		return "board/ShowMainArticles";
	}
	
	
	@GetMapping("/board/ShowMainArticlesByCategory/{category}")
	public String ShowMainArticlesByCategory(@PathVariable String category, @RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<MainArticles> mas = maService.findByCategory(category, pageNumber);
		model.addAttribute("page", mas);
		return "board/ShowMainArticlesByCate";
		
	}
	
	
//	@GetMapping("/board/AddMainArticles")
//	public ModelAndView AddMainArticle() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("MainArticles", new MainArticles());
//		mav.setViewName("/board/AddMainArticle");
//
//		return mav;
//	}

	
	//=====================================新增主業=====================================
	@GetMapping("/board/AddMainArticle")
	public String addMainArticle(Model model) {
		
		model.addAttribute("MainArticles" , new MainArticles());  //空表單
		
		return "board/AddMainArticle";
	}
	
	
	@PostMapping("/board/addMA")
	public String addMainArticle(@ModelAttribute("MainArticles") MainArticles ma, Model model) {
		maService.addMainArticle(ma);
		model.addAttribute("message", "新增成功");
		
		return "redirect:/board";

	}
	
//=======================================修改主業=======================================
	
	@GetMapping("/board/editMainArticle")
	public String editMainArticle(@RequestParam("ma_id") Integer id,Model model) {
		MainArticles msg = maService.findMainArticlesById(id);
		
		model.addAttribute("mainarticles", msg);
		
		return "board/editMainArticle";
	}
	
	
	
	@PutMapping("/board/editMainArticle")
	public String putEditedMainArticle(@ModelAttribute("mainarticles") MainArticles ma , Model model) {
		maService.updateMainById(ma.getMain_id(), ma.getContent(),ma.getTitle(),ma.getCategory(),ma.getAccess());
		model.addAttribute("message", "修改成功");
		return "redirect:/board";
	}
	
//=====================================刪除主頁=============================================
	
//	@Transactional
//	@GetMapping("/board/deleteMainArticle")
//	public String deleteMainArticle(@RequestParam("ma_id") Integer id, Model model) {
//	    maService.deleteMainArticleById(id);
//	    
//	    model.addAttribute("message", "刪除成功");
//	    return "redirect:/board";
//	}
//	@Transactional
//	@GetMapping("/board/deleteMainArticle")
//	@ResponseBody
//	public String deleteMainArticle(@RequestParam("main_id") Integer id) {    
//		System.out.println(id);
//	    maService.deleteMainArticleById(id);	    
//	    return "刪除成功";
//	}
	
	
	@Transactional
	@ResponseBody
	@DeleteMapping("/board/deleteMainArticle")
	public ResponseEntity<Object> deleteMainArticle(@RequestParam("main_id") int ma_id) {
		System.out.println("enter deleteMainArticle");
		maService.deleteMainArticleById(ma_id);
		return ResponseEntity.ok().body("Main article with ID " + ma_id + " has been deleted.");
	}


}
	
	
//=====================================

