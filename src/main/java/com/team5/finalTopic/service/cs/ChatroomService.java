package com.team5.finalTopic.service.cs;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team5.finalTopic.model.cs.ChatMessage;
import com.team5.finalTopic.model.cs.ChatMessageRepository;
import com.team5.finalTopic.model.cs.GptChatMessage;
import com.team5.finalTopic.model.cs.GptChatMessageRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
@Transactional
public class ChatroomService {

	private List<ChatMessage> messages = new ArrayList<>();

	//chatGPTApi網址
	private String API_URL ="https://api.openai.com/v1/chat/completions";

	//chatGPTApi金鑰
	private String apiKey = "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";

	@Autowired
	ChatMessageRepository CMR;

	@Autowired
	private MemberRepository MR;

	@Autowired
	private GptChatMessageRepository GCMR;

	@PersistenceContext
	private EntityManager entityManager;

	public String content;

	public ChatMessage addMessage(ChatMessage message) {

		Member customer = MR.findById(message.getCustomer().getM_number()).orElse(null);
		Member managedMember = entityManager.merge(customer);
		System.out.println("名字為" + customer.getM_name());
		message.setCustomer(managedMember);
		CMR.save(message);
		messages.add(message);
		return message;
	}

	public List<ChatMessage> getAllMessages() {
		messages = CMR.findAll();
		return messages;
	}

	// 儲存GPT智慧客服傳來的訊息
	public GptChatMessage GPTAddMessage(GptChatMessage message) {
		Member customer = MR.findById(message.getCustomer().getM_number()).orElse(null);
		Member managedMember = entityManager.merge(customer);
//		System.out.println("測試名字為" + customer.getM_name());
		message.setCustomer(managedMember);
		GCMR.save(message);
		return message;
	}

	//回應GPT智慧客服傳來的訊息
	public GptChatMessage GPTResponseMessage(GptChatMessage message) {

		content = message.getContent();
	
		String response = null;
		try {
			response = sendGPTRequest(content);
			message.setContent(response);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		System.out.println("客服GPT " + response);
		return message;

	}

	// ChatGPT API Request
	public String sendGPTRequest(String content) throws IOException {
		String model = "gpt-3.5-turbo";
		JSONObject requestBody = new JSONObject();
		requestBody.put("model", model);
		requestBody.put("messages", new JSONArray().put(new JSONObject().put("role", "user").put("content", content)));
		requestBody.put("temperature", 0.5);
		String requestBodyString = requestBody.toString();
		HttpPost request = new HttpPost(API_URL);
		StringEntity params = new StringEntity(requestBodyString, StandardCharsets.UTF_8);
		request.addHeader("Authorization", "Bearer " + apiKey);
		request.addHeader("content-type", "application/json");
		request.setEntity(params);

		try (CloseableHttpClient httpClient = HttpClientBuilder.create().build()) {
			CloseableHttpResponse response = httpClient.execute(request);
			String responseBody = EntityUtils.toString(response.getEntity());
			String responseContent = getContentFromJsonString(responseBody);
			return responseContent;
		}

	}

	//處理gpt傳回來的json字串
	public static String getContentFromJsonString(String jsonString) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
//			System.out.println("客服GPT " + jsonString);
			JsonNode rootNode = objectMapper.readTree(jsonString);
            
			String content = rootNode.get("choices").get(0).get("message").get("content").asText();

			return content;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}