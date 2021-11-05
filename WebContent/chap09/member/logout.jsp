<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "kr.or.ddit.chap08.util.Cookies" %>
<%
	// .setmaxAge(0)이 되어 로그아웃 처리가 됨
	response.addCookie(
		Cookies.createCookie("AUTH", "", 0)
	);
%>
<html>
<head><title>로그아웃</title></head>
<body>

로그아웃하였습니다.<br>
<a href="/chap09/member/loginForm.jsp">로그인화면으로 이동</a>

</body>
</html>
