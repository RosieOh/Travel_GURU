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
			opener.document.joinForm.idDuplication.value = "idCheck";
		} else {
			opener.document.joinForm.idDuplication.value = "idUncheck";
		}
		
		window.close();
	}
</script>
</html>