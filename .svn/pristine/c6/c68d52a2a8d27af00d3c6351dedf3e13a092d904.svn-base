<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLEncoder"%>
<%
	//request객체에 들어있는 파라미터 목록 중에
	//memberId 이름의 값을 가져와 id변수에 대입
	String id = request.getParameter("memberId");
	//memberId 파라미터의 값이 madvirus인지 비교
	if (id != null && id.equals("madvirus")) {
		//알파벳과 숫자 그리고 몇몇 기호를 제외한 나머지 글자들을 URL에
		//포함시키려면 인코딩을 해줘야 함
		String value = "최가현";
		//*******
		String encodedValue = URLEncoder.encode(value,"UTF-8");
		response.sendRedirect("/chap03/index.jsp?name="+encodedValue);
	} else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>
