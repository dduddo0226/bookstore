<%@page import="bookstore.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int cart_id = Integer.parseInt(request.getParameter("cart_id"));

	CartDAO.getInstance().deleteCart(cart_id);
	response.sendRedirect("../mainpage.jsp?center=cart/cartlist.jsp");
%>