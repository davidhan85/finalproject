package com.team5.finalTopic.controller.cs;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team5.finalTopic.model.cs.ChatMessage;
import com.team5.finalTopic.model.cs.GptChatMessage;
import com.team5.finalTopic.service.cs.ChatroomService;

@Controller
public class ChatRoomController {

    @Autowired
    private ChatroomService chatroomService;
    


    @MessageMapping("/chatroom/sendMessage")
    @SendTo("/topic/chatroom")
    public ChatMessage sendMessage(@Payload ChatMessage message) {
    	
    	System.out.println(message.getContent());
    	System.out.println(message.getCustomer());
        return chatroomService.addMessage(message);
    }
    
    //接收智慧客服前端傳來的訊息
    @MessageMapping("/api/Chatmessages")
    @SendTo("/topic/chatroom")
    @ResponseBody
    public GptChatMessage sendGptMessage(@Payload GptChatMessage message) {
    	
    	chatroomService.GPTAddMessage(message);   	
    	return chatroomService.GPTResponseMessage(message);
    }
    
    
    
    @GetMapping("/api/messages")
    @ResponseBody
    public List<ChatMessage> getAllMessages() {
    	
    	List<ChatMessage> messages = new ArrayList<>();
    	messages=chatroomService.getAllMessages();
    	
//    	for(ChatMessage message : messages) {
//    		if(message.getCustomer()==null)
//    			 messages.remove(message);
//    	}
        return messages;
    }

    
}