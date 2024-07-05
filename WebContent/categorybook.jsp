<%@page import="bookstore.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookstore.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int option = Integer.parseInt(request.getParameter("option"));

	String category = request.getParameter("category");

	String title = "전체";
	switch (category) {

	case "100":
		title = "문학";
		break;
	case "200":
		title = "외국어";
		break;
	case "300":
		title = "컴퓨터";
		break;
	}
	ArrayList<BookDTO> booklist = BookDAO.getInstance().selectKindNewBook(category);
%>
<main>
	<h2 align="center"><%=title%>
		도서 목록
	</h2>
	<div class="allbook-box">
		<div class="select-box">
			<ul>
				<li><button
						onclick="location.href='mainpage.jsp?center=categorybook.jsp?option=1&category=<%=category%>'">최신순</button></li>
				<li><button
						onclick="location.href='mainpage.jsp?center=categorybook.jsp?option=2&category=<%=category%>'">제목순</button></li>
				<li><button
						onclick="location.href='mainpage.jsp?center=categorybook.jsp?option=3&category=<%=category%>'">할인율높은순</button></li>
				<li><button
						onclick="location.href='mainpage.jsp?center=categorybook.jsp?option=4&category=<%=category%>'">높은가격순</button></li>
				<li><button
						onclick="location.href='mainpage.jsp?center=categorybook.jsp?option=5&category=<%=category%>'">낮은가격순</button></li>
			</ul>
		</div>
		<div class="allbook-list">
			<%
				switch (option) {

				case 1:
					booklist = BookDAO.getInstance().selectKindNewBook(category);
					break;
				case 2:
					booklist = BookDAO.getInstance().selectKindNameBook(category);
					break;
				case 3:
					booklist = BookDAO.getInstance().selectkindDiscountBook(category);
					break;
				case 4:
					booklist = BookDAO.getInstance().selectkindUpPriceBook(category);
					break;
				case 5:
					booklist = BookDAO.getInstance().selectkindDownPriceBook(category);
					break;
				}

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
						<td width="200px"><del>
								정가:
								<%=dto.getBook_price()%>원
							</del><br />
							<p style="color: #2699FB">
								판매가:
								<%=discountPrice%>원
							</p></td>
					</tr>
				</table>
			</a>

			<%
				}
			%>

		</div>
	</div>

</main>