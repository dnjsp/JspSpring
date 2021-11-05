<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>pageContext 기본 객체</title></head>
<body>
<!-- usePageContext.jsp -->
<%
/*
pageContext기본객체 : 직접사용되는 경우는 드물다.
.getRequest() => request 기본객체를 구함
.getResponse() => response 기본객체를 구함
.getSession() => session 기본객체를 구함
.getOut() => out 기본객체를 구함
...

*/
	//getRequest() 메소드 : request 기본 객체를 구함
	HttpServletRequest httpRequest = 
		(HttpServletRequest)pageContext.getRequest();
	HttpSession session01 = 
		(HttpSession)pageContext.getSession();
%>
request 기본 객체와 pageContext.getRequest()의 동일여부:
<%= request == httpRequest %>
<br>
pageContext.getOut() 메서드를 사용한 데이터 출력:
<% pageContext.getOut().println("안녕하세요!"); %>
</body>
</html>
