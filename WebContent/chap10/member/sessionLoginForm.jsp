<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>로그인폼</title></head>
<body>

<form action="/chap10/member/sessionLogin.jsp"
      method="post">
아이디 <input type="text" name="id" size="10" value="<%=session.getAttribute("MEMBERID") %>">
암호 <input type="password" name="password" size="10" value="<%=session.getAttribute("PASSWORD") %>">
<input type="submit" value="로그인">
</form>

</body>
</html>