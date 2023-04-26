package com.team5.finalTopic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	 
    private List<WebSocketSession> sessions = new ArrayList<>();
 
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        // send a welcome message to the client
        session.sendMessage(new TextMessage("Welcome to the chat room!"));
    }
 
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        for (WebSocketSession s : sessions) {
            if (s.isOpen() && !s.equals(session)) {
                s.sendMessage(new TextMessage(payload));
            }
        }
    }
 
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
    }
 
}