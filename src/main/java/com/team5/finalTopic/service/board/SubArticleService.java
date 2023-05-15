package com.team5.finalTopic.service.board;




import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.board.SubArticleLikes;
import com.team5.finalTopic.model.board.SubArticleLikesRepository;
import com.team5.finalTopic.model.board.SubArticleMessages;
import com.team5.finalTopic.model.board.SubArticleMessagesRepository;
import com.team5.finalTopic.model.board.SubArticles;
import com.team5.finalTopic.model.board.SubArticlesRepository;
@Service
public class SubArticleService {

	@Autowired
	private SubArticleLikesRepository salRepository;
	
	@Autowired
	private SubArticlesRepository saRepository;
	
	@Autowired
	private SubArticleMessagesRepository samRepository;
	
	public List<SubArticleMessages> findSubArticleMessagesBySubarticlesforsam_subid(Integer subid){
		List<SubArticleMessages> sams = samRepository.findAllBySubarticlesforsam_subid(subid);
		return sams;
	}
	
//	 public List<SubArticleMessageDTO> showSubArticleMessages(List<Integer> subArticleIds) {
//		 List<SubArticleMessageDTO> subArticleMessages = new List<>();
//		 List<Integer> subArticleIdsAsInteger = subArticleIds.stream().map(Integer::intValue).collect(Collectors.toList());
//		 List<SubArticles> subArticles = saRepository.findAllById(subArticleIdsAsInteger);
//		 List<SubArticleMessageDTO> result = new List<>();
//	        for (SubArticles subArticle : subArticles) {
//	            Set<SubArticleMessages> sams = subArticle.getSubarticlemessages();
//	            for (SubArticleMessages sam : sams) {
//	                SubArticleMessageDTO dto = new SubArticleMessageDTO();
//	                dto.setAuid(sam.getAuthoridforSAM().getM_number());
//	                dto.setContent(sam.getContent());
//	                dto.setUpdatedatetime(sam.getUpdatedatetime());
//	                result.add(dto);
//	            }
//	        }
//	        return result;
//	    }

	public SubArticles findSubArticlesById(Integer id) {
		Optional<SubArticles> option = saRepository.findById(id);

		if (option.isEmpty()) {
			return null;
		}

		return option.get();
	}
	
	public SubArticleLikes findSubArticleLikesById(Integer id) {
	

		return salRepository.findSubArticleLikesBySubarticlesforsalk_subid(id);
	}

	
	
	
	
	
	
	
	
	
	
	
	
//	public void deleteSubArticleMessages(Integer subid) {
//		samRepository.deleteById(subid);
//	}

	
	
	
}
