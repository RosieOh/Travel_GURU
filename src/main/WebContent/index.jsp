<!-- 16 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- template/template.jsp 페이지로 포워딩 이동하는 페이지 --%>
<%
	//QueryString으로 전달된 데이터(문자열)를 반환받아 저장
	String control = request.getParameter("control");
	String part = request.getParameter("part");
	
	if(control == null) control="main";
	if(part == null) part="display";
%>
<jsp:forward page="main.jsp">
	<jsp:param value="<%=control %>" name="control" />
	<jsp:param value="<%=part %>" name="part" />
</jsp:forward>