<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String memberID = request.getParameter("memberID");
	String password= request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try {
		String jdbcDriver = "jdbc:mariadb://localhost:3306/mydb";
		String dbUser = "root";
		String dbPass = "java";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// 실행할 Query를 생성
		pstmt = conn.prepareStatement(
			"insert into MEMBER2(memberid, password, name, email) values(?, ?, ?, ?)");
		// query의 각 물음표에 알맞은 값을 지정
		pstmt.setString(1, memberID);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		// query를 실행
		pstmt.executeUpdate();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<html>
<head><title>삽입</title></head>
<body>
<%
if(result > 0) { // 입력 성공
	out.print("MEMBER 테이블에 레코드 입력 성공");
} else { // 입력 실패
	out.print("입력 실패");
}
%>
</body>
</html>
