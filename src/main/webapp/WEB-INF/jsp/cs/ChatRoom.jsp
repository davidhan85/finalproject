<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>聊天室</title>
<link rel="stylesheet"
	href="css/normalize.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css'>
<link rel="stylesheet" href="css/style2.css">
</head>
<body>
	<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<div class="center" style="left: 50%; height: 50%;">
		<div class="chat">
			<div class="contact bar">
				<div class="pic stark"></div>
				<div class="name">Tony Stark</div>
				<div class="seen">Today at 12:56</div>
			</div>
			<div class="messages" id="chat">
				<div class="time">Today at 11:41</div>
				<div class="message parker">Hey, man! What's up, Mr Stark? 👋
				</div>
				<div class="message stark">Kid, where'd you come from?</div>
				<div class="message parker">Field trip! 🤣</div>
				<div class="message parker">Uh, what is this guy's problem,
					Mr. Stark? 🤔</div>
				<div class="message stark">Uh, he's from space, he came here
					to steal a necklace from a wizard.</div>
				<div class="message stark">
					<div class="typing typing-1"></div>
					<div class="typing typing-2"></div>
					<div class="typing typing-3"></div>
				</div>
			</div>
			<div class="input">
				<i class="fas fa-camera"></i><i class="far fa-laugh-beam"></i><input
					placeholder="Type your message here!" type="text" /><i
					class="fas fa-microphone"></i>
			</div>
		</div>
	</div>
	<script src='js/jquery.min.js'></script>
	<script src="js/script.js"></script>
</body>
</html>