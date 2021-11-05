<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//선언부에 메소드 생성(문제에서 주어진 숫자를 만들어주는 역할)
public static BigInteger solve(int n){
	if(n == 1) return BigInteger.valueOf(2);
	return solve(n-1).multiply(BigInteger.valueOf(3));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등비수열</title>
</head>
<body>

<%
	//스크립트 릿
	BigInteger sum = BigInteger.valueOf(0);

	for(int i=1; i<=100; i++){
		sum = sum.add(solve(i)); 
	}
%>
<!-- 표현식 -->
<%=sum%>

 

</body>
</html>



