<%@page import="bookstore.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String op = request.getParameter("op");
	int cart_id = Integer.parseInt(request.getParameter("cart_id"));
	int buy_count = Integer.parseInt(request.getParameter("buy_count"));

	if (op.equals("0")) {
		if (buy_count == 1) {
%>
<script>
	history.back();
</script>
<%
	} else {
			CartDAO.getInstance().updateBuycount(cart_id, buy_count - 1);
			response.sendRedirect("mainpage.jsp?center=cartlist.jsp");
		}

	} else if (op.equals("1")) {
		CartDAO.getInstance().updateBuycount(cart_id, buy_count + 1);
		response.sendRedirect("mainpage.jsp?center=cartlist.jsp");
	}
%>