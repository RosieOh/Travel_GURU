<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	boolean idUniqle = (boolean)request.getAttribute("idUniqle");
%>
<html>
<script type="text/javascript">
	window.onload = function() {
		if (<%=idUniqle%>){
			opener.alert("사용가능한 아이디입니다");
			opener.document.joinForm.idDuplication.value = "idCheck";
		} else {
			opener.alert("이미 사용중인 아이디입니다");
			opener.document.joinForm.idDuplication.value = "idUncheck";
		}
		
		window.close();
	}
</script>
</html>