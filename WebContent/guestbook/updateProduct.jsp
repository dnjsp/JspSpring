<%@page import="jdbc.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String productId = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정(/guestbook/updateProduct.jsp)</title>
</head>
<body>
   <jsp:include page="menu.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 수정</h1>
      </div>
   </div>
<% 
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
      conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:ddit");
      
      String sql = " SELECT * FROM PRODUCT WHERE P_ID = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, productId);
      rs = pstmt.executeQuery();
      
      if(rs.next()){
         
%>
   <div class="container">
      <div class="row">
         <div class="col-md-5">
            <img src="/images/<%=rs.getString("P_FILENAME") %>" alt="image" style="width: 100%;" />
         </div>
         <div class="col-md-7">
            <form name="newProduct" action="processUpdateProduct.jsp"
               class="form-horizontal" method="post" enctype="multipart/form-data">
               <div class="form-group row">
                  <label class="col-sm-2">상품 코드</label>
                  <div class="col-sm-3">
                     <input type="text" name="productId" id="productId"
                        class="form-control" value="<%=rs.getString("P_ID") %>" readonly />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">상품명</label>
                  <div class="col-sm-3">
                     <input type="text" name="name" id="name" class="form-control"
                        value="<%=rs.getString("P_NAME") %> 6s" />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">가격</label>
                  <div class="col-sm-3">
                     <input type="text" name="unitPrice" id="unitPrice"
                        class="form-control" value="<%=rs.getString("P_UNITPRICE") %>" />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">상세 설명</label>
                  <div class="col-sm-3">
                     <textarea name="description" id="description" cols="50" rows="2"
                        class="form-control"><%=rs.getString("P_DESCRIPTION") %></textarea>
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">제조사</label>
                  <div class="col-sm-3">
                     <input type="text" name="manufacturer" class="form-control"
                        value="<%=rs.getString("P_MANUFACTURER") %>" />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">분류</label>
                  <div class="col-sm-3">
                     <input type="text" name="category" class="form-control"
                        value="<%=rs.getString("P_CATEGORY") %>" />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">재고 수</label>
                  <div class="col-sm-3">
                     <input type="text" name="unitsInStock" id='unitsInStock'
                        class="form-control" value="<%=rs.getString("P_UNITSINSTOCK") %>" />
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">상태</label>
                  <c:set var="lth" value='<%=rs.getString("P_CONDITION") %>' scope="page"/>
                  <div class="col-sm-3">
                     <input type="radio" name="condition" value="New" 
                        <c:if test="${lth eq 'New'}">checked</c:if> />신규제품 
                     <input type="radio" name="condition" value="Old"
                        <c:if test="${lth eq 'Old'}">checked</c:if> />중고 제품 
                     <input type="radio" name="condition" value="Refurbished" 
                        <c:if test="${lth eq 'Refurbished'}">checked</c:if>/>재생 제품
                  </div>
               </div>
               <div class="form-group row">
                  <label class="col-sm-2">이미지</label>
                  <div class="col-sm-5">
                     <input type="file" name="productIamge" class="form-control" />
                  </div>
               </div>
               <div class="form-group row">
                  <div class="col-sm-offset-2 col-sm-10">
                     <input type="submit" class="btn btn-primary" value="등록" />
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>

<%
      }
   }catch(SQLException e ){
      out.print(e.getMessage());
   } finally{
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(conn);
   }

%>
   <jsp:include page="footer.jsp" />

</body>
</html>




