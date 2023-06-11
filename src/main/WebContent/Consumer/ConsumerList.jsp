<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/cart.css">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
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
	<jsp:include page="header_1.jsp" />
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회</div>
				</div>
				<c:forEach var="board" items="${boardList}">
				<div>
					<div class="num">${board.id}</div>
					<div class="title">
						<a href="${pageContext.request.contextPath}/board?cmd=view&board_id=${board.id}">${board.title}</a>
					</div>
					<div class="writer">${board.user_name}</div>
					<div class="date">${board.createDate}</div>
					<div class="count">${board.viewCount}</div>
				</div>
				</c:forEach>
			</div>
			<div class="board_page">
				<%
				int index = (int)request.getAttribute("index");
				int boardCnt = (int)request.getAttribute("boardCnt");
				int indexMax = (boardCnt-1)/5+1;
				%>
				<a href="${pageContext.request.contextPath}/board?cmd=list&index=1" class="bt first">&lt;&lt;</a>
				<a href="${pageContext.request.contextPath}/board?cmd=list&index=<%=Math.max(1, index-1)%>" class="bt prev">&lt;</a>
				<%
				for (int i=1; i <= indexMax; i++){
					if(i != index){
						%><a href="${pageContext.request.contextPath}/board?cmd=list&index=<%=i%>" class="num"><%=i%></a><%
					}
					else {
						%><a href="${pageContext.request.contextPath}/board?cmd=list&index=<%=i%>" class="num on"><%=i%></a><%
					}
				}
				%>
				<a href="${pageContext.request.contextPath}/board?cmd=list&index=<%=Math.min(indexMax, index+1)%>" class="bt next">></a>
				<a href="${pageContext.request.contextPath}/board?cmd=list&index=<%=indexMax%>" class="bt last">>></a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.principal != null}">
					<div class="bt_wrap">
						<a href="${pageContext.request.contextPath}/Consumer/ConsumerWrite.jsp" class="on">등록</a>
						<!--<a href="#">수정</a>-->
					</div>
				</c:when>
			</c:choose>

		</div>
	</div>
	<jsp:include page="footer_1.jsp" />
</body>
</html>