<%@ page contentType = "text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- http://localhost:8090/chap07/body_main.jsp?name=한주연 -->
<html>
<head><title>INFO</title></head>
<body>
include 전 name 파라미터 값: <%=request.getParameter("name") %>
<hr>
<jsp:include page="/chap07/body_sub.jsp" flush="false">
	<jsp:param name="name" value="유제이" />
</jsp:include>
<hr/>
include 후 name 파라미터 값: <%=request.getParameter("name") %>
</body>
</html>
