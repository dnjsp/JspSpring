<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Calendar" %>
<html>
<head><title>현재 시간</title></head>
<body>
<!-- /chap07/to/viewTime.jsp -->
<%
	//request 기본 객체는 makeTime.jsp에서 전달해준 객체와 같은 것임
	//makeTime.jsp와 viewTime.jsp는 하나의 request 기본 객체를 공유함
	//왜냐하면, request 기본 객체는 한 번의 요청에 대해 유효하게 동작하므로..
	Calendar cal = (Calendar) request.getAttribute("time");
%>
현재 시간은 <%=cal.get(Calendar.HOUR) %>시
			<%=cal.get(Calendar.MINUTE) %>분
			<%=cal.get(Calendar.SECOND) %>초 입니다.
</body>
</html>
