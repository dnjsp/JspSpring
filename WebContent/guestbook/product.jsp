<%@page import="java.sql.DriverManager"%>
<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
   // 장바구니에 등록하기 위한 핸들러 함수
   function addToCart() {
      if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
         // 폼의 action 속성 값을 실행
         document.addForm.submit();
      } else {
         document.addForm.reset();
      }
   }
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">상품정보</h1>
   </div>
   
   <div class="container">
      <div class="row">
<%
   String id = request.getParameter("id");
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try {
      conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
      String sql = "select * from product where P_ID = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      if (rs.next()) {
%>
         <div class="col-md-5">
            <img alt="" src='/images/<%=rs.getString("P_FILENAME") %>' style="width:100%" />
         </div>
         <div class="col-md-6">
            <h3><%=rs.getString("P_NAME") %></h3>
            <p><%=rs.getString("P_DESCRIPTION") %></p>
            <p><b>상품 코드 : </b><span class="badge badge-danger"><%=rs.getString("P_ID")%></span></p>
            <p><b>제조사 : </b><%=rs.getString("P_MANUFACTURER") %></p>
            <p><b>분류 : </b><%=rs.getString("P_CATEGORY") %></p>
            <p><b>재고 수 : </b> <fmt:formatNumber value='<%=rs.getString("P_UNITSINSTOCK") %>' pattern="#,###" />개</p>
            <h4><fmt:formatNumber value='<%=rs.getString("P_UNITPRICE") %>' pattern="#,###" />원</h4>
            <p>
               <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("P_ID") %>" method="post">
                  <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
                  <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
                  <a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a> 
               </form>
            </p>
         </div>
<%
      } else {
         // 상품이 없을 경우 임의로 오류 발생
         // catch 대신!!!!! 그래야 에러 페이지로 넘어가니까
         String str = null;
         str.toUpperCase();
      } // end if
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