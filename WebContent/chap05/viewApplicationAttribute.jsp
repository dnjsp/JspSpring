<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>application 기본 객체 속성 보기</title></head>
<body>
<%
	//getAttributeNames() 메소드 : 속성의 이름 목록을 구함(a001:smith => a001가 구해짐)
	Enumeration<String> attrEnum = application.getAttributeNames();
	while(attrEnum.hasMoreElements() ) {
		String name = attrEnum.nextElement();
		//getAttribute(name) 메소드 : 이름이 name인 속성의 값을 구함 
		Object value = application.getAttribute(name);
%>
application 속성 : <b><%= name %></b> = <%= value %> <br>
<%
	}
%>
</body>
</html>
