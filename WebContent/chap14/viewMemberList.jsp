<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 목록</h2>
<table border="1" width="100%">
<tr>
	<th>이름</th><th>아이디</th><th>이메일</th>
</tr>
<%
Class.forName("org.mariadb.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;


try{
	String jdbcDriver = "jdbc:mariadb://localhost:3306/mydb";
	String dbUser = "root";
	String dbPass = "java";
	
	String query = "select * from MEMBER2 order by MEMBERID";
	//2. 데이터 베이스 커넥션
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	//3. Statment 생성
	stmt = conn.createStatement();
	//4. 쿼리 실행
	rs = stmt.executeQuery(query);
	while(rs.next()) {
		String name = rs.getString("NAME");
		String memberId = URLEncoder.encode(rs.getString("MEMBERID"), "UTF-8");
%>
	<tr>
		<td>
<%-- 			<a href="/chap14/update/updateForm.jsp?memberId=<%=memberId %>&name=<%=name %>"> --%>
			<a href="/chap14/viewMember.jsp?memberId=<%=memberId %>">
				<%=rs.getString("NAME")%>
			</a>
		</td>
		<td><%=rs.getString("MEMBERID")%></td>
		<td><%=rs.getString("EMAIL")%></td>
	</tr>
<%
	} // end while
} catch(SQLException ex) {
	out.println(ex.getMessage());
} finally{
	if(rs!=null) try{rs.close();}catch(SQLException e){}
	if(stmt!=null) try{stmt.close();}catch(SQLException e){}
	if(conn!=null) try{conn.close();}catch(SQLException e){}
}

%>
</table>
<input type="button" value="등록" onclick="javascript:location.href='/chap14/insert/insertForm.jsp';">
</body>
</html>