<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<header>
	<div class="header">
		<%
			if (id == null) {
		%>
		<div class="login-box">
			<form action="loginpro.jsp" method="post">
				<div>
					ID: <input type="text" name="id" />
				</div>
				<div>
					PW: <input type="text" name="pw" />
				</div>
				<div>
					<button type="submit" class="btn btn-light logincheck">로그인</button>
				</div>
			</form>
		</div>
			<p style="color: red;">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.</p>
		<%
			} else {
		%>
		<div class="logout-box">
			<span><%=id%>님</span>
			<button class="btn btn-light logincheck"
				onclick="location.href='logout.jsp'">로그아웃</button>
			<button class="cartbtn">
				<i class="fa-solid fa-cart-shopping"></i>
			</button>

		</div>

		<%
			}
		%>
	</div>
</header>