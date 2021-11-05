<%@page import="kr.or.ddit.chap14.IMemberVO"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
	String memberId = request.getParameter("memberId");
	out.print("memberId : " + memberId);
%>
<html>
<head><title>회원 상세 정보</title></head>
<body>

<%
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/mydb";
		String dbUser = "root";
		String dbPass = "java";
		String query = 
		   "select * from MEMBER2 where MEMBERID = '"+memberId+"'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(query);
		// --행=로우(row)=레코드=튜플
		if( rs.next() ) { // 데이터가 있으면..
			IMemberVO imemberVO = new IMemberVO();
			imemberVO.setMemberid(memberId);
			imemberVO.setPassword(rs.getString("PASSWORD"));
			imemberVO.setName(rs.getString("NAME"));
			imemberVO.setEmail(rs.getString("EMAIL"));
%>
<c:set var="vo" value="<%=imemberVO %>" scope="page"></c:set>
<table border="1">
<tr>
	<th>아이디</th><td><span id="spanId">${vo.memberid}</span></td>
</tr>
<tr>
	<th>암호</th><td>${vo.password}</td>
</tr>
<tr>
	<th>이름</th><td><span id="spanName">${vo.name}</span></td>
</tr>
<tr>
	<th>이메일</th><td>${vo.email}</td>
</tr>
</table>
<br>
<input type="button" id="btnList" value="목록">&nbsp;
<input type="button" id="btnEdit" value="수정">
<%
		} else { // 회원이 없으면..
%>
<%= memberId %>에 해당하는 정보가 존재하지 않습니다.
<%
		} // end if
	} catch(SQLException ex) {
%>
에러 발생: <%= ex.getMessage() %>
<%
	} finally {
		// close()를 통해 자원을 반환
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>

<script src="/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnList").on("click",function(){
		location.href="/chap14/viewMemberList.jsp";
	});
	
	$("#btnEdit").on("click",function(){
		var memberId = $("spanId").text();
		var name = $("spanName").text();
		location.href="/chap14/update/updateForm.jsp?memberId=" + memberId + "&name=" + encodeURI(name);
	});
});
</script>
</body>
</html>
