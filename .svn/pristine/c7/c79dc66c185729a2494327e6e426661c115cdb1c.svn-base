<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	//request객체는 JSP에서 기본으로 제공해주는 객체
	request.setCharacterEncoding("utf-8");
%>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<b>request.getParameter() 메서드 사용</b><br>
<!-- 
이름이 name / address .. 인 파라미터의 값을 구함
-->
name 파라미터 = <%= request.getParameter("name") %> <br>
address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameterValues() 메서드 사용</b><br>
<%
	//요청 파라미터 이름이 pet인 파라미터의 값을 배열로 구함
	String[] values = request.getParameterValues("pet");
	if (values != null) {
	for (int i = 0 ; i < values.length ; i++) {
%>
	<%= values[i] %>
<%
		}
	}
%>
<p>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	//요청 파라미터의 이름 목록을 구함
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
		<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() 메서드 사용</b><br>
<%
	//요청 파라미터의 맵을 구함. 맵은 <파라미터 이름, 값> 쌍으로 구성됨
	/*
	{"name":"홍길동","address":"대전","pet":"dog cat pig"}
	*/
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("pet");
	if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>
