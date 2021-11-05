<%@page import="kr.or.ddit.guestbook.service.WriteMessageService"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestbookMessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록에 메시지를 남김</title>
</head>
<body>
<jsp:useBean id="message" class="kr.or.ddit.guestbook.vo.GuestbookMessageVO">
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean>

<%
// GuestbookMessageVO vo = new GuestbookMessageVO();
// int messageId = request.getParameter("messageId") == null?0:
// 				Integer.parseInt(request.getParameter("messageId"));
// vo.setGuestName(request.getParameter("guestName"));
// vo.setPassword(request.getParameter("password"));
// vo.setMessage(request.getParameter("message"));

out.print("message : " + message.toString());

WriteMessageService writeService = WriteMessageService.getInstance();
writeService.write(message);
%>
방명록에 메시지를 남겼습니다.<br>
<a href="list.jsp">목록보기</a>
</body>
</html>