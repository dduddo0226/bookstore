<%@page import="bookstore.CartDAO"%>
<%@page import="bookstore.CartDTO"%>
<%@page import="bookstore.BookDTO"%>
<%@page import="bookstore.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	int bookID = Integer.parseInt(request.getParameter("book_id"));
	int buyCount = Integer.parseInt(request.getParameter("count"));
			
	BookDTO dto = BookDAO.getInstance().detailBook(bookID);
	
	CartDTO cartDto = new CartDTO();
	cartDto.setBuyer((String)session.getAttribute("id"));
	cartDto.setBook_id(dto.getBook_id());
	cartDto.setBook_title(dto.getBook_title());
	cartDto.setBuy_price(dto.getBook_price());
	cartDto.setBuy_count(buyCount);
	cartDto.setBook_image(dto.getBook_image());
	
	CartDAO.getInstance().insertCart(cartDto);

%>
<jsp:forward page="mainpage.jsp?center=cartlist.jsp"></jsp:forward>