<%@ page contentType = "text/html; charset=utf-8" %>
<%!
	//선언부 -> 메서드
	//a, b : 파라미터의 이름
	//GoupSaem(int a , int b) <- X
	//<메서드 이름 규칙>
	//1. 첫 글자는 문자(알파벳소문자, 한글(비추천)) 또는 밑줄(_)로 시작해야 함
	//2. 첫 글자를 제외한 나머지는 문자와 숫자 그리고 밑줄의 조합이어야 함
	//3. 메서드 이름은 대소문자를 구분한다.
	public int multiply(int a, int b) {
		int c = a * b;
		return c;
	}
%>
<html>
<head><title>선언부를 사용한 두 정수값의 곱</title></head>
<body>
<!-- 표현식 -->
10 * 25 = <%=multiply(10, 25)%>

</body>
</html>
