<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- readInitaParameter.jsp -->
	초기화 파라미터 목록:
	<ul>
		<%
		/*
		web.xml의 초기화 파라미터는 JSP의 application  기본 객체를 통해 사용
		1. .getInitParameterNames() : 초기화 파라미터 이름 목록 리턴
		2. .getInitParameter() : 초기화 파라미터 값 리턴
		
		ex) DB 연결 설정 파일 경로, 로깅 설정 파일 경로, 웹 어플리케이션 주요 속성 정보가 담긴 파일 경로
		*/
			Enumeration<String> initParamEnum = application.getInitParameterNames();
			while(initParamEnum.hasMoreElements()) {
				//loadEnabled
				String initParamName = initParamEnum.nextElement();
		%>
		<li><%=initParamName %> = <%=application.getInitParameter(initParamName) %>
		<%
			}
		%>	
	</ul>
</body>
</html>