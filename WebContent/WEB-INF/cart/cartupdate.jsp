<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@page import="bookstore.model.CartDTO"%>
<%@page import="bookstore.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("id") == null) {
		%>
		<script>
			alert('로그인이 필요한 서비스 입니다');
			history.back();
		</script>
		<%
	} else {
		int bookID = Integer.parseInt(request.getParameter("book_id"));
		int buyCount = Integer.parseInt(request.getParameter("count"));
 	
		BookDTO dto = BookDAO.getInstance().detailBook(bookID);

		CartDTO cartDto = new CartDTO();
		cartDto.setBuyer((String) session.getAttribute("id"));
		cartDto.setBook_id(dto.getBook_id());
		cartDto.setBook_title(dto.getBook_title());
		cartDto.setBuy_price(dto.getBook_price());
		cartDto.setBuy_count(buyCount);
		cartDto.setBook_image(dto.getBook_image());

		CartDAO.getInstance().insertCart(cartDto);
		response.sendRedirect("../mainpage.jsp?center=cart/cartlist.jsp");
	}
%>
