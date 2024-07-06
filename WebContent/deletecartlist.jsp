<%@page import="bookstore.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	int cart_id = Integer.parseInt(request.getParameter("cart_id"));

	CartDAO.getInstance().deleteCart(cart_id);
	
%>
<jsp:forward page="mainpage.jsp?center=cartlist.jsp"/>