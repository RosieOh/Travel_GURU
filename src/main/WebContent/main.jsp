<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Travel_GURU</title>

<meta property="og:type" content="website" />
<meta property="og:site_name" content="현대자동차" />
<meta property="og:title" content="현대자동차" />
<meta property="og:description"
	content="현대자동차 공식 홈페이지에 오신것을 환영합니다. 현대자동차의 최신 차량 정보부터 인기모델들을 확인하실 수 있습니다." />
<meta property="og:image" content="./images/header_logo/logo.png" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/body.css" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css"
	type="text/css" />
<script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script defer src="./js/main.js"></script>
<script defer src="./js/body.js"></script>
</head>
<body>
	<jsp:include page="./layout/header.jsp" />
	<jsp:include page="./main/banner_test.jsp" />
	<section>
		<div class="section_1">
			<h2>이달의 당신을 위한 여행</h2>
			<div class="swiper-container">
				<div class="swiper-wrapper">

					<div class="swiper-slide">
						<ul>
							<li class="list_card">
								<h4 class="list_title">하노이 나트랑 시티투어</h4> <img
								src="${pageContext.request.contextPath}/images/product/taiwan.jpg"
								alt="image">
								<div class="list_contents">최대 페이백 10만원 할인</div>
								<div class="list_sub"></div>
								<div class="list_button">
									<button>자세히 보기</button>
									<button>여행 상담 신청</button>
								</div>
							</li>
							<li class="list_card">
								<h4 class="list_title">캐나다 토론토 시티투어</h4> <img
								src="${pageContext.request.contextPath}/images/product/toronto.jpg"
								alt="image">
								<div class="list_contents">최대 페이백 10만원 할인</div>
								<div class="list_sub"></div>
								<div class="list_button">
									<button>자세히 보기</button>
									<button>여행 상담 신청</button>
								</div>
							</li>
							<li class="list_card">
								<h4 class="list_title">스페인 바르셀로나 투어</h4> <img
								src="${pageContext.request.contextPath}/images/product/barcelona.jpg"
								alt="image">
								<div class="list_contents">최대 페이백 10만원 할인</div>
								<div class="list_sub"></div>
								<div class="list_button">
									<button>자세히 보기</button>
									<button>여행 상담 신청</button>
								</div>
							</li>
							<li class="list_card">
								<h4 class="list_title">거대한 모스크와 아부다비 투어</h4> <img
								src="${pageContext.request.contextPath}/images/product/uae.jpg"
								alt="image">
								<div class="list_contents">최대 페이백 10만원 할인</div>
								<div class="list_sub"></div>
								<div class="list_button">
									<button>자세히 보기</button>
									<button>여행 상담 신청</button>
								</div>
							</li>
						</ul>
					</div>

				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</section>

	<section class="section_3">
		<div class="event_container">
			<h4>Travel_GURU 소식</h4>
			<ul class="event_tag">
				<a href="javascript:void(0)"><li>#All</li></a>
				<a href="javascript:void(0)"><li>#TravelForYou</li></a>
				<a href="javascript:void(0)"><li>#Travel_GURU</li></a>
				<a href="javascript:void(0)"><li>#Refresh</li></a>
				<a href="javascript:void(0)"><li>#TheFutureofTravel</li></a>
				<a href="javascript:void(0)"><li>#about_Travel_GURU</li></a>
				<a href="javascript:void(0)"><li>#휴식</li></a>
				<a href="javascript:void(0)"><li>#프로미스나인</li></a>
				<a href="javascript:void(0)"><li>#장효경교수님 만세</li></a>
			</ul>

			<div class="sns_container">
				<ul class="sns">
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/1.png" alt="sns"> <span class="main">SNS</span>
							<div class="sns-hover"></div>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/2.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/3.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/4.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/5.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/6.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/7.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
					<li><a href="javascript:void(0)"> <img
							src="./images/sns/8.png" alt="sns"> <span class="main">SNS</span>
					</a></li>
				</ul>
			</div>
		</div>
	</section>
	<jsp:include page="./layout/footer.jsp" />
</body>
</html>
