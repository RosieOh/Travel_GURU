<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/newloginc.css">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/body.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css" />
<script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script defer src="${pageContext.request.contextPath}/js/main.js"></script>
<script defer src="${pageContext.request.contextPath}/js/body.js"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="page-container">
		<form method="post"
			action="${pageContext.request.contextPath}/user?cmd=login">
			<div class="login-form-container shadow">
				<div class="login-form-right-side">
					<div class="top-logo-wrap"></div>
					<h1>대한민국 최저가! 최고의 여행경험!</h1>
					<p>#동아시아 #미주 #유럽 #동남아 #중동 #더추가?</p>
				</div>
				<div class="login-form-left-side">
					<div class="login-top-wrap">
						<span>계정이 없으신가요?</span>
						<button class="create-account-btn shadow-light">계정 생성</button>
					</div>
					<div class="login-input-container">
						<div class="login-input-wrap input-id">
							<i class="far fa-envelope"></i>
							<input name="id" placeholder="아이디를 입력해주세요" type="text" required>
						</div>
						<div class="login-input-wrap input-password">
							<i class="fas fa-key"></i>
							<input name="password" placeholder="비밀번호를 입력해주세요" type="password" required>
						</div>
					</div>
					<div class="login-btn-wrap">
						<button class="login-btn" type="submit">로그인</button>
						<a href="#">비밀번호를 잊으셨나요?</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include
		page="../layout/footer.jsp" />
</body>
</html>
