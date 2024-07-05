<%@page import="bookstore.BookDTO"%>
<%@page import="bookstore.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int bookId = Integer.parseInt(request.getParameter("book_id"));
	BookDTO dto = BookDAO.getInstance().detailBook(bookId);
	int discountPrice = (dto.getBook_price() / 100) * (100 - dto.getDiscount_rate());
%>
<main class="section">
	<div class="bookinfo-box">
		<div class="bookimg-box">
			<img alt="사진" src="images/<%=dto.getBook_image()%>" width="100%" height="100%">
		</div>
		<div class="bookpay-box">
			<div id="booktitle">
				<%=dto.getBook_title()%>
			</div>
			<div>
				<span id="discount"><%=dto.getDiscount_rate()%>%</span><span><%=dto.getBook_price()%>원</span><span
					id="disprice"><del><%=discountPrice%>원
					</del></span>
			</div>
			<div>
				<p><%=dto.getAuthor()%>
					저자(글)
				</p>
				<p><%=dto.getPublishing_com()%>
					|
					<%=dto.getPublishing_date()%></p>
			</div>
			<div>
				<p style="font-size: 18px">
					<strong>상세설명</strong>
				</p>
				<p><%=dto.getBook_content()%></p>
			</div>
			<div>
				<form action="mainpage.jsp?center=cartlist.jsp" method="post">
					<input type="hidden" name="book_id" value="<%=bookId %>" >
					<div style="display: flex; border-bottom: none;">
						수량:<select class="form-select form-select-sm"
							aria-label="Small select example" name="count"
							style="width: 60px; margin-left: 6px;">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<input type="submit" class="btn btn-outline-secondary" value="장바구니" />
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='mainpage.jsp?center=allbooklist.jsp?option=1'">목록으로</button>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='mainpage.jsp'">메인으로</button>
				</form>
			</div>
		</div>
	</div>
</main>