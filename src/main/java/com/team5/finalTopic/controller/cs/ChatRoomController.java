package com.team5.finalTopic.controller.cs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.team5.finalTopic.service.cs.ChatroomService;
import com.team5.finalTopic.websocket.ChatMessage;

@Controller
public class ChatRoomController {

    @Autowired
    private ChatroomService chatroomService;

    @MessageMapping("/chatroom/sendMessage")
    @SendTo("/topic/chatroom")
    public ChatMessage sendMessage(ChatMessage message) {
    	
    	System.out.println(message.getContent());
        return chatroomService.addMessage(message);
    }

}