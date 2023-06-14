<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productInfo.css">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script defer src="./js/main.js"></script>
<script defer src="./js/body.js"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap"
	rel="stylesheet">
</head>
<body>
<jsp:include page="../layout/header.jsp" />
	<div class="container">
		<div class="continent">
			<h2>아시아</h2>
			<div class="slider-container">
				<div class="slider">
				<c:forEach var="product" items="${asiaProductList}">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">
						<div class="slide-content">
							<h3>${product.name}</h3>
							<p>${product.summary}</p>
							<p class="price">${product.price}원</p>
							<a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<button class="prev-btn">&#10094;</button>
				<button class="next-btn">&#10095;</button>
			</div>
		</div>
		<div class="continent">
			<h2>미주</h2>
			<div class="slider-container">
				<div class="slider">
				<c:forEach var="product" items="${americaProductList}">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">
						<div class="slide-content">
							<h3>${product.name}</h3>
							<p>${product.summary}</p>
							<p class="price">${product.price}</p>
							<a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<button class="prev-btn">&#10094;</button>
				<button class="next-btn">&#10095;</button>
			</div>
		</div>
		<div class="continent">
			<h2>유럽</h2>
			<div class="slider-container">
				<div class="slider">
				<c:forEach var="product" items="${europeProductList}">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">
						<div class="slide-content">
							<h3>${product.name}</h3>
							<p>${product.summary}</p>
							<p class="price">${product.price}</p>
							<a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<button class="prev-btn">&#10094;</button>
				<button class="next-btn">&#10095;</button>
			</div>
		</div>
		<div class="continent">
			<h2>중동</h2>
			<div class="slider-container">
				<div class="slider">
				<c:forEach var="product" items="${middleasiaProductList}">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">
						<div class="slide-content">
							<h3>${product.name}</h3>
							<p>${product.summary}</p>
							<p class="price">${product.price}</p>
							<a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<button class="prev-btn">&#10094;</button>
				<button class="next-btn">&#10095;</button>
			</div>
		</div>
		<div class="continent">
			<h2>오세아니아</h2>
			<div class="slider-container">
				<div class="slider">
				<c:forEach var="product" items="${oceaniaProductList}">
					<div class="slide">
						<img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">
						<div class="slide-content">
							<h3>${product.name}</h3>
							<p>${product.summary}</p>
							<p class="price">${product.price}</p>
							<a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<button class="prev-btn">&#10094;</button>
				<button class="next-btn">&#10095;</button>
			</div>
		</div>
	</div>
<jsp:include page="../layout/footer.jsp" />
	<script src="${pageContext.request.contextPath}/js/productInfo.js"></script>
</body>
</html>
