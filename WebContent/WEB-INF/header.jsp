<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<header>
	<div class="header">
		
	</div>
	<p style="color: red;">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.</p>
</header>

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