package com.team5.finalTopic.controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team5.finalTopic.model.board.MainArticleMessages;
import com.team5.finalTopic.model.board.MainArticlePics;
import com.team5.finalTopic.model.board.MainArticlePicsRepository;
import com.team5.finalTopic.model.board.MainArticles;
import com.team5.finalTopic.model.board.SubArticleMessageDTO;
import com.team5.finalTopic.model.board.SubArticleMessages;
import com.team5.finalTopic.model.board.SubArticles;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.board.MainArticleMessageService;
import com.team5.finalTopic.service.board.MainArticleService;
import com.team5.finalTopic.service.board.SubArticleMessageService;
import com.team5.finalTopic.service.board.SubArticleService;

@Controller
public class MainArticleController {

	@Autowired
	private MainArticleService maService;
	@Autowired
	private SubArticleService saService;
	@Autowired
	private MainArticleMessageService mamService;
	
	@Autowired
	private SubArticleMessageService samService; 
	
	@Autowired
	private MainArticlePicsRepository MaPicRepository;
	
//	@Autowired
//	private SubArticleMessagesRepository samRepository;

	@Autowired
	private com.team5.finalTopic.service.member.MemberService MemberService;
//	@Autowired
//	private MainArticlesRepository maRepo;

// =========================主文與回文分頁=================================
	@GetMapping("board/MainArticle")
	public String showMainArticle(@RequestParam(name = "maid") Integer id,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		MainArticles MA = maService.findMainArticlesById(id);
		// 在這裡加入回文葉面
		Page<SubArticles> page = maService.findSubByPage(id, pageNumber);
		
		List<MainArticleMessages> mams = maService.findMainArticleMessagesByMainarticlesformam_mainid(id);
//		List<SubArticleMessages> sams = saService.findSubArticleMessagesBySubarticlesforsam_subid(subid);
		model.addAttribute("page", page);
		model.addAttribute("SubArticles" , new SubArticles());  //空表單
		model.addAttribute("MainArticles", MA);
		model.addAttribute("MainArticleMessages", mams);
//		model.addAttribute("SubArticleMessages", sams);
		return "board/MainArticle";

	}

// =========================圖片上傳與載入=================================
	@ResponseBody
	@PostMapping("/upload/image")
	public ResponseEntity<Map<String, String>> uploadImage(@RequestParam("file") MultipartFile file) {

		System.out.println("上傳controller");

		try {
			// 將上傳的檔案轉換為 byte[]
			byte[] imageData = file.getBytes();

			// 將圖片資料存入資料庫
			MainArticlePics image = new MainArticlePics();
			image.setData(imageData);
			MainArticlePics Map = MaPicRepository.save(image);

			// 回傳圖片的 URL
			String imageUrl = "http://localhost:8079/finalTopic_5/upload/image/" + Map.getId();

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

// =========================留言上傳與顯示予刪除=================================

//	
//	@PostMapping("/board/uploadMAM")
//	public String uploadMessages(@RequestBody MainArticleMessages mam) {
//		mamService.addMainArticleMessages(mam);
//		return "board/MainArticle";
//	}
//	
	
	@GetMapping("/board/deleteMAM")
	public String deleteMainArticleMessages(@RequestParam("mamid") Integer id) {
		String newContent = "此留言已被刪除";
		 mamService.updateMainMessageById(id, newContent);
		
		 return "redirect:/board";
	}

// =========================回文上傳與顯示====================================
	
	@PostMapping("/board/addSA/{mainid}/{pagenumber}")
	public String addSubArticle(@ModelAttribute("SubArticles") SubArticles sa, @PathVariable(name="mainid") Integer mainid,
			@PathVariable(name="pagenumber", required = false) Integer p, Model model) {
		maService.addSubArticle(sa);
		model.addAttribute("SubArticles" , new SubArticles());
		model.addAttribute("message", "新增成功");

		if(p == 0) {
			return "redirect:/board/MainArticle?maid=" + mainid;
		} else {
			return "redirect:/board/MainArticle?p=" + p + "&maid=" + mainid;
		}
	}

	








// =========================回文留言上傳與顯示====================================
	
	@ResponseBody
	@PostMapping("/board/subArticleMessages")
	public List<SubArticleMessageDTO> postMessageApi(@RequestBody SubArticleMessageDTO samdto)
			throws JsonProcessingException {
		System.out.println("xxxx" + samdto);
		Member member = MemberService.findById(samdto.getAuid());
		System.out.println("eeee"+ samdto.getSubid());
		SubArticles sa = saService.findSubArticlesById(samdto.getSubid());
		System.out.println("bbbbb"+ sa);
		SubArticleMessages msg = new SubArticleMessages();

		msg.setAuthoridforSAM(member);
		msg.setSubarticlesforsam(sa);
		msg.setContent(samdto.getContent());
		samService.addSubArticleMessages(msg);

		List<SubArticleMessages> sams = samService.findSubArticleMessages(samdto.getSubid());
		List<SubArticleMessageDTO> samsDTO = sams.stream()
			    .map(sam -> {
			        SubArticleMessageDTO samDTO = new SubArticleMessageDTO();
			        samDTO.setUpdatedatetime(sam.getUpdatedatetime());
			        samDTO.setAuid(sam.getAuthoridforSAM().getM_number());
			        samDTO.setAuaccount(sam.getAuthoridforSAM().getM_account());
			        samDTO.setContent(sam.getContent());
			        samDTO.setSubid(samdto.getSubid());
			        return samDTO;
			    })
			    .collect(Collectors.toList());

		
		return samsDTO;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//   @ResponseBody
//	@PostMapping("board/showSubArticleMessages")
//    public List<SubArticleMessages> showSubArticleMessages(@RequestBody SubArticleMessageDTO  samDTO) {
//	   List<Integer> subArticleIds = samDTO.getSubArticleIds();
//	   System.out.println("aaaaa" + subArticleIds);
//	   List<SubArticleMessages> messages = findSubArticleMessagesBySubArticleforSAM_subid(subArticleIds);
//	   System.out.println("vvvvvvvvv" +messages.get(1));
//	   
//	   
//        return messages;
//    }
//
//   
//   
//   public List<SubArticleMessages> findSubArticleMessagesBySubArticleforSAM_subid(List<Integer> subArticleIds) {
//	    List<SubArticleMessages> messages = new ArrayList<>();
//	    for (Integer subArticleId : subArticleIds) {
//	        // 根據子文章ID查找相關的子文章訊息
//	        List<SubArticleMessages> subArticleMessages = samRepository.findSubArticleMessagesBySubarticlesforsam_subid(subArticleId);
//	       System.out.println("bbbbb"+subArticleMessages);
//	        
//	        messages.addAll(subArticleMessages);
//	        
//	    }
//	    return messages;
//	}
//
}
	

// =========================主文按讚上傳與顯示=================================
// =========================回文按讚上傳與顯示=================================
// =========================留言文按讚上傳與顯示=================================
	
	
	
	
