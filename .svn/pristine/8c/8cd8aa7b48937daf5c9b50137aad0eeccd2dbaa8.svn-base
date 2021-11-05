<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>main</title>
</head>
<body>

main.jsp에서 생성한 내용.

<!-- jsp: => 액션 태그 -->
<!-- 
jsp:include 
위치한 부분에 지정한 페이지를 포함
-->
<!-- 
flush="true" => 출력 버퍼를 플러시한다는 의미
액션태그를 실행하는 시점에 출력 버퍼에 저장된 [main.jsp에서 생성한 내용.]을 화면에 보인 후
sub.jsp 페이지로 흐름이 이동함. 이 때 응답 상태 코드와 HTTP 응답 헤더가 웹 브라우저에 함께
전송됨. 그래서 sub.jsp에서 response.setHeader()를 실행해도 헤더가 추가되지 않음
헤더에는 어떤 정보가 들어가나? 응답의 몸체가 어떤 데이터인지, 길이는 어떻게 되는지 정보.
-->
<jsp:include page="sub.jsp" flush="false">
	<jsp:param name="id" value="a001" />
</jsp:include>

include 이후의 내용.

</body>
</html>
