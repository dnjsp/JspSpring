<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//읽어올 파라미터의 캐릭터 인코딩을 UTF-8로 지정함
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="lprod" class="kr.or.ddit.chap08.LprodVO"  scope="request" />
<jsp:setProperty name="lprod" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty property="lprodId" name="lprod"/><br />
<jsp:getProperty property="lprodGu" name="lprod"/><br />
<jsp:getProperty property="lprodNm" name="lprod"/>
</body>
</html>