<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>로그 메시지 기록</title></head>
<body>
<!-- useApplicationLog.jsp -->
<%
//웹 컨테이너(톰캣)가 사용하는 로그 파일에 로그 메시지 기록
	application.log("로그 메시지 기록");

//JSP 페이지가 제공하는 log() 메소드를 이용
	log("로그 메시지 기록2");
%>
로그 메시지를 기록합니다.

</body>
</html>
