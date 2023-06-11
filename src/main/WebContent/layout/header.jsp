<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="../css/header.css" />
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
	<header class="header">
		<ul class="header_menu">
			<c:choose>
				<c:when test="${sessionScope.principal != null}">
					<li class="menu_list"><a href=".javascript:void(0)">${sessionScope.principal.name} 님</a></li>
					<li class="menu_list"><a href="${pageContext.request.contextPath}/user?cmd=logout">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li class="menu_list"><a href="${pageContext.request.contextPath}/signin/signin.jsp">개인 로그인</a></li>
					<li class="menu_list"><a href="${pageContext.request.contextPath}/signin/signin.jsp">관리자 로그인</a></li>
					<li class="menu_list"><a href="${pageContext.request.contextPath}/signup/signup.jsp">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			<li class="menu_list"><a href="javascript:void(0)">LANGUAGE</a></li>
			<li class="menu_list"><a class="search"
				href="javascript:void(0)">검색</a></li>
			<li class="menu_search">
				<div class="form">
					<input type="text" placeholder="검색어를 입력해주세요." />
				</div>
			</li>
		</ul>
		<div class="header_list">
			<a href="/Web_Server_Programming_final"> <img class="header_logo"
				src="${pageContext.request.contextPath}/images/header_logo/logo_1.png" alt="logo" />
			</a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/product?cmd=info">여행코스</a></li>
				<li><a href="${pageContext.request.contextPath}/cart?cmd=show">장바구니</a></li>
				<li><a href="${pageContext.request.contextPath}/board?cmd=list">고객지원</a></li>
				<li><a href="${pageContext.request.contextPath}/">이용약관</a></li>
				<li><a href="${pageContext.request.contextPath}/intro/intro.jsp">회사소개</a></li>
			</ul>
		</div>
	</header>
</div>
</body>
</html>