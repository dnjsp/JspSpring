<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 수치 연산자</title>
</head>
<body>

${"10"+1}<br />
${"10"-1}<br />
${"10.0"*2}<br />
${"10"/2}<br />
${"10"+"20"}<br />
<!-- 
숫자변환이 안되는 객체와 수치 연산자는 함께 사용할 수 없음.
 -->
<%--  ${"50"+"억"}<br />  안됨--%>
${"50"}억<br /> 
<!-- 수치 연산자에서 null은 0으로 처리한다. -->
${null + 1}<br />
${1/null }<br />
<!-- 자바에서는 1 but, EL은 1.5.. 왜냐하면, Double로 변환 후 연산 수행 -->
${3/2 }<br />
<%
String str = "2021";
request.setAttribute("str2", str);
%>
<!-- false -->
${str=="2021"}<br />
${str.compareTo("2021")==0}<br/>
<!-- true -->
${str2 }<br />
${str2=="2021" }<br />
</body>
</html>