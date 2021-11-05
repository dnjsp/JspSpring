<%@ page contentType = "text/html; charset=utf-8" %>
<!-- /chap07/body_sub.jsp -->
<!-- jsp:param name="name" value="유제이" -->
body_sub에서 name 파라미터 값: <%=request.getParameter("name") %>
<br/>
name 파라미터 값 목록:
<ul>
<%
	//기본객체 중요 네가지 : pageContext, request, session, application객체
	//기본객체의 중요 네가지 메소드. setParameter, getParameter,
	//						 removeParameter, getParameterValues
	String[] names = request.getParameterValues("name");
	for (String name : names) {
%>
	<li> <%=name %> </li>
<%
	}
%>
</ul>