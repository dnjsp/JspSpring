<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>out 기본 객체 사용</title></head>
<body>
<!-- useOutObject.jsp -->
<%
	/*
		out.print() : 데이터 출력
		out.println() : 데이터 출력하고, 줄바꿈 문자(\r\n) 출력
		out.newLine() : 줄바꿈 문자(\r\n) 출력
		out.println() = out.print() + out.newline()
	*/
	out.print("유재면 학생, ");
	out.println("안녕하세요?");
%>
<br>
out 기본 객체를 사용하여 
<%
	out.println("출력한 결과입니다.");
	out.print("그럼..<br />");
	out.newLine();
	out.println("끝..");
%>

</body>
</html>
