<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	
	if (name != null && value != null) {
		application.setAttribute(name, value);
		//이름이 myname인 속성의 값으로 kcs를 지정함
		application.setAttribute("myname","kcs");
		//이름이 myage인 속성의 값으로 25를 지정함
		application.setAttribute("myage","25");
		//만약 4번째 줄의 value의 값이 remove이면
		//해당 속성을 삭제함
		///chap05/setApplicationAttribute.jsp?name=a001&value=remove
		if(value.equals("remove")){
			//application.removeAttribute("a001");
			application.removeAttribute(name);
		}
	}
%>
<!-- http://localhost:8090/chap05/setApplicationAttribute.jsp?name=a001&value=smith -->
<html>
<head><title>application 속성 지정</title></head>
<body>
<%
	if (name != null && value != null) {
%>
application 기본 객체의 속성 설정:
 <%= name %> = <%= value %>
<%
	} else {
%>
application 기본 객체의 속성 설정 안 함
<%
	}
%>
<%
request.setAttribute("id", "a001");
String id1 = (String)request.getAttribute("id");

String id2 = (String)pageContext.getAttribute("id");
String id3 = (String)session.getAttribute("id");
String id4 = (String)application.getAttribute("id");
%>
</body>
</html>
