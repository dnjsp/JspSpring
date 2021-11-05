<%@page import="kr.or.ddit.guestbook.service.MessageListView"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// page 파라미터 값을 이용하여 읽어올 페이지 번호를 생성
String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if(pageNumberStr != null){
	pageNumber = Integer.parseInt(pageNumberStr);
}

GetMessageListService listService = GetMessageListService.getInstance();

MessageListView list = listService.getMessageList(pageNumber);

out.print("list.size() : " + list.getMessageList().size());
%>
<c:set var="viewData" value="<%=list %>"/>
<!DOCTYPE html>
<html>
<head>
<title>방명록 목록</title>
</head>
<body>
<form action="/guestbook/writeMessage.jsp" method="post">
	이름 : 
	<input type="text" name="guestName" placeholder="이름을 입력해주세요" required/><br>
	비밀번호 :
	<input type="password" name="password" required/><br>
	메시지 :
	<textarea name="message" rows="3" cols="30" required></textarea><br>
	<input type="submit" value="메시지 남기기"/>
</form>
<!-- 
[수정]
1. 클릭 시 상단의 폼에 정보가 입력되고 (비밀번호 제외)
	"메세지 남기기" 버튼이 hidden, "확인" 및 "취소" 버튼이 block
2. "확인" 클릭 시 해당 정보가 업데이트되는데, 비밀번호가 일치해야 함
3. "취소" 클릭 시 현재 페이지의 목록으로 되돌아감
	"메세지 남기기" 버튼이 block, "확인" 및 "취소" 버튼이 hidden

[삭제]
1. 클릭 시 비밀번호를 입력하는 요소가 block. 입력한 비밀번호가 일치하면 delete처리
2. delete 완료 후 현재 페이지의 목록으로 되돌아감
-->
<table border="1">
<c:forEach var="message" items="${viewData.messageList}">
<tr>

	<td>
		메시지 번호 : ${message.messageId}<br>
		손님 이름 : ${message.guestName}<br>
		메시지 : ${message.message}<br>
		<button value="수정">수정</button>
		<button value="삭제">삭제</button>
	</td>
</tr>
</c:forEach>
</table>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotal}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>&nbsp;
</c:forEach>

</body>
</html>

