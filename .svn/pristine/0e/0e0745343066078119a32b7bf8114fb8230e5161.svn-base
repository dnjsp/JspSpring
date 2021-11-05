<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
String data;
%>
<%
String key=request.getParameter("key");

if(key==null || key.equals("input")){
%>
<form action="redirectTest.jsp" method="get">
Input:
<input type="text" name="data">
<input type="hidden" name="key" value="output">
<input type="submit" value="print">
<input type="button" value="exit" onclick="location.href='redirectTest.jsp?key=exit'">
</form> 
<% }else if(key.equals("output")){
data=request.getParameter("data");
%>
입력한 값은<b><%=data %></b>입니다.<br>
<input type="button" value="reinput"
onclick="location.href='redirectTest.jsp?key=input'">
<input type="button" value="exit"
onclick="location.href='redirectTest.jsp?key=exit'">
<% }else if(key.equals("exit")){
%> 
<script type="text/javascript">
alert("exit..");
location.href='redirectTest.jsp?key=input';
</script>
<% 
//response.sendRedirect("redirectTest.jsp");
}
%>
</body>
</html>