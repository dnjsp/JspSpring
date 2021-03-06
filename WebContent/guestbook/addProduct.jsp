<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/validation.js"></script>
<title>/guest/addProduct.jsp</title>
</head>
<body>
<!-- 
fmt : bundle => 태그 몸체에서 사용할 리소스 번들을 지정함
fmt : message => 메시지를 출력
fmg : setBundle => 특정 메시지 번들을 사용할 수 있도록 로딩함

위치 : src/bundle/message.properties 및 src/bundle/message_en.properties
-->
<fmt:setLocale value='<%=request.getParameter("language")%>' />
<fmt:bundle basename="bundle.message">
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">상품 등록</h1>
   </div>
</div>
<div class="container">
   <div class="text-right">
      <a href="?language=ko">Korean</a>&nbsp;|&nbsp;
      <a href="?language=en">English</a>
   </div>
   <form action="processAddProduct.jsp" name="newProduct" class="form-horizontal" method="post" enctype="multipart/form-data">
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="productId" /></label>
         <div class="col-sm-3">
            <input type="text" name="productId" id="productId" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="pname" /></label>
         <div class="col-sm-3">
            <input type="text" name="name" id="name" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitPrice" /></label>
         <div class="col-sm-3">
            <input type="text" name="unitPrice" id="unitPrice" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="description" /></label>
         <div class="col-sm-3">
            <textarea name="description" cols="50" rows="2"  class="form-control"></textarea>
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="manufacturer" /></label>
         <div class="col-sm-3">
            <input type="text" name="manufacturer" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="category" /></label>
         <div class="col-sm-3">
            <input type="text" name="category" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
         <div class="col-sm-3">
            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="condition" /></label>
         <div class="col-sm-3">
            <input type="radio" name="condition" value="New" />&nbsp;<fmt:message key="condition_New" />&nbsp;
            <input type="radio" name="condition" value="Old" />&nbsp;<fmt:message key="condition_Old" />&nbsp;
            <input type="radio" name="condition" value="Refurbished" />&nbsp;<fmt:message key="condition_Refurbished" />
         </div>
      </div>
      <div class="form-group row">
         <label class="col-sm-2"><fmt:message key="productImage" /></label>
         <div class="col-sm-5">
            <input type="file" name="productImage" class="form-control" />
         </div>
      </div>
      <div class="form-group row">
         <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddProduct()" />
         </div>
      </div>
   </form>
</div>
</fmt:bundle>
<jsp:include page="footer.jsp"/>

</body>
</html>