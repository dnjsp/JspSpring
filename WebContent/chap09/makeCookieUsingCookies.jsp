<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%
	response.addCookie(Cookies.createCookie("name", "최범균"));
	response.addCookie(
		Cookies.createCookie("id", "madvirus", -1));
%>
<html>
<head><title>Cookies 사용 예</title></head>
<body>

Cookies를 사용하여 쿠키 생성

</body>
</html>
