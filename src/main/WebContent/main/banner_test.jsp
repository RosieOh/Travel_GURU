<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Swiper demo</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
	transition-timing-function: linear;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>

<body>
	<section class="banner">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="./images/banners/1.png" />
					<div class="swiper__button">
						<button><a href="${pageContext.request.contextPath}/product?cmd=info">여행코스</a></button>
						<button><a href="${pageContext.request.contextPath}/signin/signin.jsp">더보기</a></button>
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-scrollbar"></div>
		</div>

		<div class="log_bar">
			<span class="login_text"> 로그인 하시고 <b>Travel_GURU</b>의 다양한 취향의
				맞춤형 여행서비스를 이용해 보세요.
			</span> <span class="login_text2"><a
				href="/Web_Server_Programming_final/signin/signin.jsp">로그인</a></span> <span
				class="login_text2"><a
				href="/Web_Server_Programming_final/signup/signup.jsp">회원가입</a></span>
		</div>

	</section>
	<div class="tap_service">
		<div class="tap">
			<span>땡처리 여행 정보</span>
		</div>
		<div class="tap">
			<span>내게 맞는 할인 정보</span>
		</div>
	</div>

	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</body>

</html>