<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>서버 정보 출력</title></head>
<body>
<!-- viewServerInfo.jsp -->
서버정보: <%= application.getServerInfo() %> <br>
서블릿 규약 메이저 버전: <%= application.getMajorVersion() %> <br>
서블릿 규약 마이너 버전: <%= application.getMinorVersion() %>

<!-- 
서버정보: Apache Tomcat/8.5.37
서블릿 규약 메이저 버전: 3
서블릿 규약 마이너 버전: 1
=> 톰캣 8.5.37 버전이 서블릿 3.1 규약을 지원한다.
-->
</body>
</html>


