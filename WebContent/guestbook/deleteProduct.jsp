<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String productId = request.getParameter("id");
%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try {
      conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
      String sql = "select * from product where p_id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, productId);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
         sql = "DELETE FROM PRODUCT WHERE P_ID = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, productId);
         pstmt.executeUpdate();
      } else {
         response.sendRedirect("exceptionNoProductId.jsp");
      }
   } catch(SQLException e) {
      out.print(e.getMessage());
   } finally {
      JdbcUtil.close(conn);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(rs);
   }
   response.sendRedirect("editProduct.jsp?edit=delete");
%>