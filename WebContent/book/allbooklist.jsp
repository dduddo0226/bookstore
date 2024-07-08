<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main>
	<h2 align="center">전체 도서 목록</h2>
	<div class="allbook-box">
		<div class="select-box">
			<ul>
				<li><button onclick="location.href='mainpage.jsp?center=book/allbooklist.jsp?option=1'">최신순</button></li>
				<li><button onclick="location.href='mainpage.jsp?center=book/allbooklist.jsp?option=2'">제목순</button></li>
				<li><button onclick="location.href='mainpage.jsp?center=book/allbooklist.jsp?option=3'">할인율높은순</button></li>
				<li><button onclick="location.href='mainpage.jsp?center=book/allbooklist.jsp?option=4'">높은가격순</button></li>
				<li><button onclick="location.href='mainpage.jsp?center=book/allbooklist.jsp?option=5'">낮은가격순</button></li>
			</ul>
		</div>
		<div class="allbook-list">
			<%
			
				int option = Integer.parseInt(request.getParameter("option"));
			
				ArrayList<BookDTO> booklist = BookDAO.getInstance().selectAllNewBook();
				
				switch(option){
				
				case 1:
					booklist = BookDAO.getInstance().selectAllNewBook();
					break;
				case 2:
					booklist = BookDAO.getInstance().selectAllNameBook();
					break;
				case 3:
					booklist = BookDAO.getInstance().selectAllDiscountBook();
					break;
				case 4:
					booklist = BookDAO.getInstance().selectAllUpPriceBook();
					break;
				case 5:
					booklist = BookDAO.getInstance().selectAllDownPriceBook();
					break;
				}
				
				for(BookDTO dto: booklist){
					int discountPrice = (dto.getBook_price() / 100) * (100 - dto.getDiscount_rate());
			%>
			<a href="mainpage.jsp?center=book/bookinfo.jsp?book_id=<%=dto.getBook_id()%>">
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
						<td width="200px"><del>정가: <%=dto.getBook_price()%>원</del><br /><p style="color:#2699FB; display: inline-block;">판매가: <%=discountPrice%>원</p>
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