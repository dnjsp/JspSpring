<!-- /guestbook/munu.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/guestbook/welcome.jsp">Home</a>
			<a class="navber-brand" href="/guestbook/addProduct.jsp">상품등록</a>
		</div>
	</div>
	<div>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="./products.jsp">상품 목록</a></li>
			<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품 등록</a></li>
			<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a></li>
			<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a></li>
		</ul>
	</div>
</nav>