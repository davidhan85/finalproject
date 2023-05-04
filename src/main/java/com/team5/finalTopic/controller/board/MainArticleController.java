package com.team5.finalTopic.controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.model.board.MainArticlePics;
import com.team5.finalTopic.model.board.MainArticlePicsRepository;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.service.board.MainArticleService;

@Controller
public class MainArticleController {

	@Autowired
	private MainArticleService maService;

	@Autowired
	private MainArticlePicsRepository MaPicRepository;

//	@Autowired
//	private MainArticlesRepository maRepo;

	@GetMapping("board/MainArticle")
	public String showMainArticle(@RequestParam(name = "ma_id") Integer id, Model model) {
		MainArticles MA = maService.findMainArticlesById(id);
		model.addAttribute("MainArticles", MA);
		return "board/MainArticle";

	}

	@ResponseBody
	@PostMapping("/upload/image")
	public ResponseEntity<Map<String , String>>uploadImage(@RequestParam("upload") MultipartFile file) {
		
		System.out.println("上傳controller");

		try {
			// 將上傳的檔案轉換為 byte[]
			byte[] imageData = file.getBytes();

			// 將圖片資料存入資料庫
			MainArticlePics image = new MainArticlePics();
			image.setData(imageData);
			MainArticlePics Map = MaPicRepository.save(image);

			// 回傳圖片的 URL
			String imageUrl = "http://localhost:8078/finalTopic_5/upload/image/" + Map.getId();
			
			 Map<String, String> response = new HashMap<>();
		        response.put("url", imageUrl);
		        return ResponseEntity.ok().body(response);

		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	@ResponseBody
	@GetMapping("/upload/image/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		// 從資料庫取得圖片資料
		MainArticlePics image = MaPicRepository.findById(id).orElse(null);
		if (image == null) {
			return ResponseEntity.notFound().build();
		}

		// 回傳圖片的 byte[]
		byte[] imageData = image.getData();
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageData);
	}
}
