<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 로그인</title>
</head>
<body>

<form id="frm" name="frm" method="post" action="/chap07/login/loginPost.jsp">
	<input type="text" name="memId" placeholder="Id를 입력해주세요" /><br />
	<input type="password" name="memPwd" placeholder="비밀번호를 입력해주세요" /><br />
	<input type="submit" value="로그인" />&nbsp;
	<input type="reset" value="재작성" />
</form>

</body>
</html>