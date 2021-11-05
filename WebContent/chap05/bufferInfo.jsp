<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 정보</title>
</head>
<body>

<%
//스크립트 릿
for(int i=0;i<10000;i++){
	out.print("개똥이");
}
%>
<br />
버퍼 크기 : <%=out.getBufferSize()%><br />
남은 크기 : <%=out.getRemaining()%><br />
auth flush : <%=out.isAutoFlush()%><br />

</body>
</html>