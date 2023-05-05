package com.team5.finalTopic.service.cs;

import org.springframework.stereotype.Service;

import com.team5.finalTopic.websocket.ChatMessage;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChatroomService {

    private List<ChatMessage> messages = new ArrayList<>();

    public ChatMessage addMessage(ChatMessage message) {
        messages.add(message);
        return message;
    }

    public List<ChatMessage> getMessages() {
        return messages;
    }

}