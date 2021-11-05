<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록(/guestbook/products.jsp)</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">상품 목록</h1>
   </div>
   
   <div class="container">
      <div class="row" align="center">
<%

   Connection conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
      String sql = "select * from product";
      pstmt = conn.prepareStatement(sql);
      // select문 실행
      rs = pstmt.executeQuery();
      // select문으로 가져온 레코드가 있을 때까지
      // 각각의 필드값을 가져와 출력하도록 반복해서 실행
      while(rs.next()){
         
%>         
         <div class="col-md-4">
            <img src="/images/<%=rs.getString("P_FILENAME") %>" style="width:100%" />
            <h3><%=rs.getString("P_NAME") %></h3>
            <p><%=rs.getString("P_DESCRIPTION") %></p>
            <p><%=rs.getInt("P_UNITPRICE") %></p>
            <p><a href="./product.jsp?id=<%=rs.getString("P_ID") %>"
               class="btn btn-secondary" role="button">상세 정보&raquo;</a>
            </p>
         </div>
<%
      }//end while   

   } catch (SQLException e ) {
      out.print(e.getMessage());
   } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(conn);
   }

%>         
      </div>
   </div>
   
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>