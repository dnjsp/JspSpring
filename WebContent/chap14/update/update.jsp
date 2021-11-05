<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	// {"memberID":"a001","name":"개똥이"}
	String memberID = request.getParameter("memberID");
	String name = request.getParameter("name");
	
	int updateCount = 0;
	// jdbc 드라이버 로딩(오라클 jdbc 드라이버는 오라클드라이버이다.)
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		// 수동커밋
		// conn.setAutoCommit(false);
		// thin드라이버(jdk에서 잘 돌아감.)
		String jdbcDriver = "jdbc:mariadb://localhost:3306/mydb";
		String dbUser = "root";
		String dbPass = "java";
		// {"memberID":"a001","name":"개똥이"}
		String query = "update MEMBER2 set NAME = '"+name+"' "+
					   "where MEMBERID = '"+memberID+"'";
		// Connection 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// 생성된 connection으로부터 statement 생성
		stmt = conn.createStatement();
		// updateCount : 수정된 건수
		updateCount = stmt.executeUpdate(query);
		// conn.commit();
	} catch(SQLException ex) {
		ex.printStackTrace();
	} finally {
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<html>
<head><title>이름 변경</title></head>
<body>
<%  if (updateCount > 0) { %>
<%= memberID %>의 이름을 <%= name %>(으)로 변경<br>
	<a href="/chap14/viewMemberList.jsp">목록</a>
<%  } else { %>
<%= memberID %> 아이디가 존재하지 않음
<%  } %>

</body>
</html>
