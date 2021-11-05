<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head>
<title>회원 목록(/chap14/viewMemberUsingPool.jsp)</title>
</head>
<body>

<h2>MEMBER 테이블의 내용</h2>
<table width="100%" border="1">
<tr>
	<td>이름</td><td>아이디</td><td>이메일</td>
</tr>
<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:apache:commons:dbcp:ddit";
		String query = "select * from MEMBER2 order by MEMBERID";
		conn = DriverManager.getConnection(jdbcDriver);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()) {
%>
	<tr>
		<td><%= rs.getString("NAME") %></td>
		<td><%= rs.getString("MEMBERID") %></td>
		<td><%= rs.getString("EMAIL") %></td>
	</tr>
<%
		} // end while
	} catch(SQLException e) {
		e.printStackTrace();	
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</table>

</body>
</html>
