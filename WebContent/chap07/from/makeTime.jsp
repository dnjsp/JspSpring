<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Calendar" %>
<%
/*
** request 기본 객체는 한 번의 요청(maketime.jsp + viewTime.jsp)에 
     대해 유효하게 동작함
*/
	// /chap07/from/makeTime.jsp
	Calendar cal = Calendar.getInstance();
// 	String hour = cal.get(Calendar.HOUR) + "";
// 	String minute = cal.get(Calendar.MINUTE) + "";
// 	String second = cal.get(Calendar.SECOND) + "";
	request.setAttribute("time", cal);
%>
<%-- <jsp:forward page="/chap07/to/viewTime.jsp"> --%>
<%-- 	<jsp:param name="hour" value="<%=hour%>" /> --%>
<%-- 	<jsp:param name="minute" value="<%=minute%>" /> --%>
<%-- 	<jsp:param name="second" value="<%=second%>" /> --%>
<%-- </jsp:forward> --%>
