<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>loginCalc.jsp</title>
<script type="text/javascript">
$(function(){
	$("#btnIn").on("click", function() {
		window.open("/chap10/member/memberRegist.jsp"
				,"oWin"
				,"width=700,height=700");
	});
});
</script>
</head>
<body>
<button id="btnId">회원가입 및 로그인</button>
${true and true} : ${true and false} : ${false and false} <br />
${true or true} : ${true or false} : ${false or false} <br />
<br />
<c:if test="${sessionScope.memberVo.memId=='a001' }">관리자</c:if>
<c:if test="${sessionScope.memberVo.memId!='a001' }">사용자</c:if>
<c:if test="${sessionScope.memberVo.memId!='null' }">나그네</c:if>

<br />
${sessionScope.memberVo.memId }
</body>
</html>