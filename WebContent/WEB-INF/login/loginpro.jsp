<%@page import="bookstore.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	int result = MemberDAO.getInstance().selectMember(id, pw);
	if (result == 1) {
		session.setAttribute("id", id);
		response.sendRedirect("../mainpage.jsp");
	} else {
%>
<script>
	alert("아이디 또는 비밀번호를 확인해주세요.");
	history.go(-1);
</script>
<%
	}
%>