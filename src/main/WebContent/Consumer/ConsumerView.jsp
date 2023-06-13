<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link rel="stylesheet" href="./cart.css">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/Consumer/css/css.css">
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
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">${board.title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${board.id}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${board.user_name}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${board.createDate}</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>${board.viewCount}</dd>
					</dl>
				</div>
				<div class="cont">
					${board.content}
				</div>
			</div>
			<div class="bt_wrap">
				<a href="${pageContext.request.contextPath}/board?cmd=list" class="on">목록</a>
				<c:choose>
					<c:when test="${sessionScope.principal.id == board.user_id}">
						<a href="${pageContext.request.contextPath}/board?cmd=rewriteStart&board_id=${board.id}">수정</a>
						<a href="${pageContext.request.contextPath}/board?cmd=delete&board_id=${board.id}">삭제</a>
					</c:when>
					<c:when test="${sessionScope.principal.auth == 'admin'}">
						<a href="${pageContext.request.contextPath}/board?cmd=delete&board_id=${board.id}">삭제</a>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>