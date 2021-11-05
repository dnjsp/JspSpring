<%@ page contentType = "text/html; charset=utf-8" %>
<%!
	//선언부
	//<리턴타입>
	//1. 정수 값 : int, long, short
	//2. 실수 값 : float, double
	public int add(int a, int b) {
		int c = a + b;
		return c;
	}
	//파라미터 3과 9가 파라미터 이름 변수 a와 b에 각각 할당
	public int subtract(int a, int b) {
		int c = a - b;
		return c;
	}
%>
<html>
<head><title>스크립트릿에서 선언부 사용하기</title></head>
<body>
<%
	int value1 = 3;
	int value2 = 9;
	//스크립트릿에서도 선언부에서 정의한 메서드를 사용할 수 있다.
	int addResult = add(value1, value2);
	int subtractResult = subtract(value1, value2);
%>

<%= value1 %> + <%= value2 %> = <%= addResult %>
<br>
<%= value1 %> - <%= value2 %> = <%= subtractResult %>

</body>
</html>
