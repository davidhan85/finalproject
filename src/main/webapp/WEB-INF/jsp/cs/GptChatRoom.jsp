<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<!DOCT<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>YPE html>
					<html>

					<head>
						<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
						<title>智慧客服聊天室</title>
						<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
						<jsp:include page="../layout/navebar.jsp"></jsp:include>
						<link rel="stylesheet" href="${contextRoot}/css/main.css" />
						<link rel="stylesheet" href="${contextRoot}/css/style4.css">
					</head>

					<body>
						<!-- partial:index.partial.html -->
						<div>
							<ul class="chat-thread" style="position: relative;height: 530px; overflow-y: auto;">
							</ul>
							<form class="chat-window" onsubmit="return false;" style="position: relative;">
								<input class="chat-window-message" name="chat-window-message" type="text"
									autocomplete="off" autofocus />
									<button type="button" onclick="sendMessage()" style="position: relative; right:-100%; bottom: 30px;">發送</button>
							</form>
						</div>
						<!-- partial -->
						<script src='${contextRoot}/js/jquery.min.js'></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
						<div style="position: relative">
							<jsp:include page="../layout/footerbar.jsp"></jsp:include>
						</div>
						<script>

							// 使用 memberbean 變量來操作 JavaBean 屬性的值
							var memberID = '${memberbean.m_number}';
							var memberName = '${memberbean.m_name}';

							//開啟websocket
							var socket = new SockJS('/finalTopic_5/websocket');
							var stompClient = Stomp.over(socket);
							stompClient.connect({}, function (frame) {
								stompClient.subscribe('/topic/chatroom', function (message) {
									// console.log('Received message: ' + message.body);
									// console.log(JSON.parse(message.body));
									showGptMessage(JSON.parse(message.body));
								});
							});

							//當檢測到按下enter鍵時，會自動將訊息送出
							function checkEnterKey(event) {
								if (event.keyCode === 13) {
									sendMessage();
								}
							}

							document.querySelector('.chat-window-message').addEventListener('keypress', checkEnterKey);

							function sendMessage() {
								var message = document.querySelector('.chat-window-message').value;

								if (message) {
									showMessage(message)
									stompClient.send("/app/api/Chatmessages", {}, JSON
										.stringify({
											'content': message,
											'timestamp': new Date().getTime(),
											'customer': memberID
										}));
									document.querySelector('.chat-window-message').value = '';

								}

							}

							function showMessage(messageContent) {
								var chatThread = document.querySelector('.chat-thread');
								var li = document.createElement('li');
								const username = memberName;
								const content = messageContent
								const imageNumber = memberID;//顯示大頭貼號碼
								li.textContent = content
								li.setAttribute('data-username', username); // 添加 username 到 data-username 属性中													
								li.classList.add('chat-myself');
								const img = document.createElement('img');
								img.setAttribute('src', '${contextRoot}/memberlist/' + imageNumber);
								img.setAttribute('class', 'profile-pic-right');
								li.appendChild(img);
								chatThread.appendChild(li);

							}

							function showGptMessage(message) {
								var chatThread = document.querySelector('.chat-thread');
								var li = document.createElement('li');
								const username = message.customer.m_name;
								const content = message.content;
								const imageNumber = message.customer.m_number;//顯示大頭貼號碼
								li.textContent = message.content;
								li.setAttribute('data-username', 'AI客服'); // 添加 username 到 data-username 属性中
								li.classList.add('chat-other');
								const img = document.createElement('img');
								img.setAttribute('src', '${contextRoot}/images/ChatAI.jpg');
								img.setAttribute('class', 'profile-pic-left');
								li.appendChild(img);

								chatThread.appendChild(li);
							}
						</script>

					</body>

					</html>