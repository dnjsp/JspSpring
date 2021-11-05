<%@ page contentType="text/html; charset=utf-8" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head><title>3장 예제</title></head>
<body>
3장의 인덱스 페이지

<!-- 
익스플로러
/chap03/index.jsp?name=%EC%B5%9C%EA%B0%80%ED%98%84
크롬
/chap03/index.jsp?name=최가현

크롬/파이어폭스 웹 브라우저는 UTF-8로 인코딩 된 주소 경로나 파라미터 값을 
해당 문자로 변환해서 보여주지만 
인터넷 익스플로러는 인코딩된 파라미터 값을 그대로 보여주기 때문임
-->

<%=request.getParameter("name")%>

</body>
</html>
