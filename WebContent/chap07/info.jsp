<%@ page contentType = "text/html; charset=utf-8" %>
<!-- /chap07/info.jsp -->
<html>
<head><title>INFO</title></head>
<body>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>제품번호</td> <td>XXXX</td>
</tr>
<tr>
	<td>가격</td> <td>10,000원</td>
</tr>
</table>
<!-- /chap07/infoSub.jsp?type=A -->
<jsp:include page="/chap07/infoSub.jsp" flush="false">
	<jsp:param name="type" value="A" />
</jsp:include>

</body>
</html>
