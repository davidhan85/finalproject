package com.team5.finalTopic.websocket;

public class ChatMessage {
	private String content;
	private long timestamp;

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

//	private String sender;
//	private MessageType type;

//	public enum MessageType {
//		CHAT, LEAVE, JOIN
//	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

//	public String getSender() {
//		return sender;
//	}
//
//	public void setSender(String sender) {
//		this.sender = sender;
//	}
//
//	public MessageType getType() {
//		return type;
//	}
//
//	public void setType(MessageType type) {
//		this.type = type;
//	}
}
