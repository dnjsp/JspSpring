<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%
	Cookies cookies = new Cookies(request);
%>
<html>
<head><title>Cookie 사용</title></head>
<body>

name 쿠키 = <%= cookies.getValue("name") %> <br>
<%  if (cookies.exists("id")) { %>
id 쿠키 = <%= cookies.getValue("id") %> <br>
<%  }  %>
</body>
</html>
