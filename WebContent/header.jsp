<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
%>
<header>
	<div class="header">
		<div>
			<a href="#"> 전체목록보기</a>
		</div>
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
		<%
			} else {
		%>
		<div>
			<span><%=id%>님</span>
			<button class="btn btn-light logincheck"
				onclick="location.href='logout.jsp'">로그아웃</button>
			<button id="go-cart" onclick="location.href='mainpage.jsp?center=cartlist.jsp'">
				<i class="fa-solid fa-cart-shopping"></i>
			</button>

		</div>

		<%
			}
		%>
	</div>
	<p style="color: red;">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.</p>
</header>