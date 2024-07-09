<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String[] kindList = { "100", "200", "300" };
	String[] kindName = { "문학", "외국어", "컴퓨터" };
%>
<main>
	<h2>신간 소개</h2>
	<%
		for (int i = 0; i < kindList.length; i++) {
			ArrayList<BookDTO> newList = BookDAO.getInstance().selectKindNewBook(kindList[i]);
	%>

	<div class="list-box">
		<h3>
			<%=kindName[i]%>
		</h3>
		<div class="list-box-inner">
			<%
				for (int j = 0; j < 3; j++) {
						BookDTO newBook = newList.get(j);
						int discountPrice = (newBook.getBook_price() / 100) * (100 - newBook.getDiscount_rate());
			%>

			<a href="mainpage.jsp?center=book/bookinfo.jsp?book_id=<%=newBook.getBook_id()%>">
				<table width="400px">
					<tr>
						<td rowspan="5" width="150px" height="200px"><img alt="사진"
							src="images/<%=newBook.getBook_image()%>" width="100%"
							height="100%"></td>
					</tr>
					<tr>
						<td width="200px"><%=newBook.getBook_title()%></td>
					</tr>
					<tr>
						<td width="200px">출판사 : <%=newBook.getPublishing_com()%></td>
					</tr>
					<tr>
						<td width="200px">저자 : <%=newBook.getAuthor()%></td>
					</tr>
					<tr>
						<td width="200px"><del>정가: <%=newBook.getBook_price()%>원</del><br /><p style="color:#2699FB;">
							판매가:<%=discountPrice%>원</p>
						</td>
					</tr>
				</table>
			</a>
			<%
				}
			%>
		</div>
		<div class="addButton">
			<button type="button" class="btn btn-light" onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=<%=kindList[i]%>'">더보기</button>
		</div>
	</div>

	<%
		}
	%>
</main>