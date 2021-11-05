<%@page import="kr.or.ddit.chap08.util.Cookies"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
// Cookies cookies = new Cookies(request);
// cookies.createCookie("name", "유제이");
//public static Cookie createCookie(String name, String value) 
Cookies.createCookie("name", "유제이");
/*
Cookie 클래스는 쿠키를 삭제하는 기능을 별도로 제공하지 않음.
유효시간을 0으로 지정해준 후 응답 헤더에 추가하면, 웹 브라우저가 관련 쿠키를 삭제하게 됨
*/
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i = 0 ; i < cookies.length ; i++) {
			if (cookies[i].getName().equals("name")) {
				//name의 값을 ""로 변경
				Cookie cookie = new Cookie("name", "");
				//유효시간을 0초로 지정
				cookie.setMaxAge(0);
				//응답 헤더에 추가
				response.addCookie(cookie);
			}
		}
	}
%>
<html>
<head><title>쿠키 삭제</title></head>
<body>
name 쿠키를 삭제합니다.<br />
<a href="/chap09/viewCookies.jsp">쿠키 목록</a>
</body>
</html>
