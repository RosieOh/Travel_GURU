<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_write_wrap">
			<form name="board_write" method="post" action="${pageContext.request.contextPath}/board?cmd=rewriteEnd&board_id=${board.id}">	
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd><input name="title" type="text" placeholder="제목 입력" value="${board.title}"></dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>글쓴이</dt>
							<dd>${board.user_name}</dd>
						</dl>
						<dl>
							<dt>작성일</dt>
							<dd>${board.createDate}</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea name="content" placeholder="내용 입력">${board.content}</textarea>
					</div>
				</div>
				<div class="bt_wrap">
					<a href="javascript:board_write.submit()" class="on">수정</a> <a href="${pageContext.request.contextPath}/board?cmd=list">취소</a>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>