<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head><title>MEMBER 테이블 레코드 삽입</title></head>
<body>

<form action="/chap14/insert/insert.jsp" id="frm" method="post">
<table border="1">
<tr>
    <td>아이디</td>
    <td><input type="text" name="memberID" size="10"></td>
    <td>암호</td>
    <td><input type="text" name="password" size="10"></td>
</tr>
<tr>
    <td>이름</td>
    <td><input type="text" name="name" size="10"></td>
    <td>이메일</td>
    <td><input type="text" name="email" size="10"></td>
</tr>
<tr>
    <td colspan="4"><input type="submit" value="삽입"></td>
</tr>
</table>
</form>

<script type="text/javascript">
function fn_chk(){
	var frm = document.getElementById("frm");	
	var id = frm.memberID.value;	
	var password = frm.password.value;	
	var name = frm.name.value;	
	var email = frm.email.value;	
	
	alert("id : " + id + ", password : " + password + ", name : " + name + ", email : " + email);

	if(id == "") {alert("아이디를 입력해주세요"); return false;}
	if(password == "") {alert("비밀번호를 입력해주세요"); return false;}
	if(name == "") {alert("이름을 입력해주세요"); return false;}
	if(email == "") {alert("이메일을 입력해주세요"); return false;}

	return false;
}
</script>
</body>
</html>
