package com.team5.finalTopic.model.cs;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.URI;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.http.HttpHeaders;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketExtension;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class MyWebSocketSession implements WebSocketSession {

	private String id;
	private boolean open = true;
	private Map<String, Object> attributes = new ConcurrentHashMap<>();

	@Override
	public List<WebSocketExtension> getExtensions() {
		// 返回 WebSocketExtension 对象
		return null;
	}

	public MyWebSocketSession() {
		this.id = generateSessionId();
	}

	private String generateSessionId() {
		// 生成唯一的 session id
		return "session_" + System.currentTimeMillis();
	}

	@Override
	public String getId() {
		return this.id;
	}

	@Override
	public URI getUri() {
		return null; // 返回 WebSocket 连接的 URI
	}

	@Override
	public Map<String, Object> getAttributes() {
		return this.attributes;
	}

	@Override
	public Principal getPrincipal() {
		return null; // 返回 WebSocket 连接的身份验证信息
	}

	@Override
	public InetSocketAddress getLocalAddress() {
		return null; // 返回本地地址
	}

	@Override
	public InetSocketAddress getRemoteAddress() {
		return null; // 返回远程地址
	}

	@Override
	public String getAcceptedProtocol() {
		return null; // 返回接受的协议
	}

	@Override
	public void setTextMessageSizeLimit(int messageSizeLimit) {
		// 设置文本消息的最大大小
	}

	@Override
	public int getTextMessageSizeLimit() {
		return 0; // 返回文本消息的最大大小
	}

	@Override
	public void setBinaryMessageSizeLimit(int messageSizeLimit) {
		// 设置二进制消息的最大大小
	}

	@Override
	public int getBinaryMessageSizeLimit() {
		return 0; // 返回二进制消息的最大大小
	}

	@Override
	public boolean isOpen() {
		return this.open;
	}

	@Override
	public void sendMessage(WebSocketMessage<?> message) throws IOException {
		// 发送消息到客户端
	}

	@Override
	public void close() throws IOException {
		this.open = false;
	}

	@Override
	public void close(CloseStatus status) throws IOException {
		this.open = false;
	}

	@Override
	public HttpHeaders getHandshakeHeaders() {
		// TODO Auto-generated method stub
		return null;
	}
}