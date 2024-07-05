<%@page import="bookstore.BookDAO"%>
<%@page import="bookstore.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<main>
	<div class="allbook-list">
		<%
			request.setCharacterEncoding("UTF-8");

			String search = request.getParameter("search");
			out.print(search);

			ArrayList<BookDTO> booklist = BookDAO.getInstance().searchBook(search.trim());
			for (BookDTO dto : booklist) {
				int discountPrice = (dto.getBook_price() / 100) * (100 - dto.getDiscount_rate());
		%>
		<a href="">
			<table width="400px">
				<tr>
					<td rowspan="5" width="150px" height="200px"><img alt="사진"
						src="images/<%=dto.getBook_image()%>" width="100%" height="100%"></td>
				</tr>
				<tr>
					<td width="200px"><%=dto.getBook_title()%></td>
				</tr>
				<tr>
					<td width="200px">출판사 : <%=dto.getPublishing_com()%></td>
				</tr>
				<tr>
					<td width="200px">저자 : <%=dto.getAuthor()%></td>
				</tr>
				<tr>
					<td width="200px">정가: <%=dto.getBook_price()%>원<br />판매가: <%=discountPrice%>원
					</td>
				</tr>
			</table>
		</a>

		<%
			}
		%>

	</div>
	</div>
</main>