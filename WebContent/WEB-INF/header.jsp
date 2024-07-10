<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>

<div class="header container">
	<div class="row">
		<div class="logo-box col-3">
			<a href="home.sha"><img alt="로고" src="images/logo.svg"></a>
		</div>
		
		<div class="col-9" style="text-align: right;">
			<p style="color: red;">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.</p>
		</div>
	</div>
</div>

<!--
		<div>
			<span><%=id%>님</span>
			<button class="btn btn-light logincheck"
				onclick="location.href='login/logout.jsp'">로그아웃</button>
			<button id="go-cart"
				onclick="location.href='mainpage.jsp?center=cart/cartlist.jsp'">
				<i class="fa-solid fa-cart-shopping"></i>
			</button>
		</div>
	 -->