<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
						<title>Chat Tupi | Spring Boot + WebSocket</title>
						<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
						<jsp:include page="../layout/navebar.jsp"></jsp:include>
						<link rel="stylesheet" href="${contextRoot}/css/main.css" />
						<link rel="stylesheet" href="${contextRoot}/css/style4.css">
					</head>

					<body>
						<!-- partial:index.partial.html -->
						<ul class="chat-thread">
							<li>Are we meeting today?</li>
							<li>yes, what time suits you?</li>
							<li>I was thinking after lunch, I have a meeting in the morning</li>
						</ul>

						<form class="chat-window">
							<input class="chat-window-message" name="chat-window-message" type="text" autocomplete="off"
								autofocus />
							<button type="button" onclick="sendMessage()">发送</button>
						</form>

						<!-- partial -->
						<script src='${contextRoot}/js/jquery.min.js'></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>



						<%-- <script src='${contextRoot}/js/script.js'></script> --%>

							<script>
								var socket = new SockJS('/finalTopic_5/websocket');
								var stompClient = Stomp.over(socket);
								stompClient.connect({}, function (frame) {
									stompClient.subscribe('/topic/chatroom', function (message) {
										console.log('Received message: ' + message.body);
										showMessage(JSON.parse(message.body));
									});
								});

								function sendMessage() {
									var message = document.querySelector('.chat-window-message').value;
									if (message) {
										stompClient.send("/app/chatroom/sendMessage", {}, JSON
											.stringify({
												'content': message,
												'timestamp': new Date().getTime()
											}));
										document.querySelector('.chat-window-message').value = '';
									}
								}

								function showMessage(message) {
									var chatThread = document.querySelector('.chat-thread');
									var li = document.createElement('li');
									li.textContent = message.content;
									chatThread.appendChild(li);
								}
							</script>

					</body>

					</html>