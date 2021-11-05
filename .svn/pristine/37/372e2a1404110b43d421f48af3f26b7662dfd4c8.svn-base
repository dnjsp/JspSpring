<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#error{color:red;font-size:10pt;}
</style>
<%
	//1.파라미터
	String errMsg = (String)request.getParameter("errMsg");
	//2. request스코프에 담긴 오류메시지 얻어오기.
	//String errMsg = (String)request.getAttribute("errMsg");
	if(errMsg==null){
		errMsg="";
	}
%>
</head>
<body>
<form method="post" action="loginOk.jsp">
	아이디<input type="text" name="id"/><br/>
	비밀번호<input type="password" name="pwd"/><br/>
	<div id="error"><%=errMsg %></div>
	<input type="submit" value="로그인"/>
</form>
</body>
</html>
