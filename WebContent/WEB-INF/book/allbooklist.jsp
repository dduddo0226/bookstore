<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	<h2 align="center">전체 도서 목록</h2>
	<div class="allbook-box">
		<div class="select-box">
			<ul>
				<li><button
						onclick="location.href='?option=1'">최신순</button></li>
				<li><button
						onclick="location.href='?option=2'">제목순</button></li>
				<li><button
						onclick="location.href='?option=3'">할인율높은순</button></li>
				<li><button
						onclick="location.href='?option=4'">높은가격순</button></li>
				<li><button
						onclick="location.href='?option=5'">낮은가격순</button></li>
			</ul>
		</div>
		<div class="allbook-list">
			<c:forEach var="book" items="${booklist}">
				<a
					href="mainpage.jsp?center=book/bookinfo.jsp?book_id=${book.book_id}">
					<table width="400px">
						<tr>
							<td rowspan="5" width="150px" height="200px"><img alt="사진"
								src="images/${book.book_image}" width="100%" height="100%"></td>
						</tr>
						<tr>
							<td width="200px">${book.book_title}</td>
						</tr>
						<tr>
							<td width="200px">출판사 : ${book.publishing_com}</td>
						</tr>
						<tr>
							<td width="200px">저자 : ${book.author}</td>
						</tr>
						<tr>
							<td width="200px"><del> 정가: ${book.book_price}원 </del><br />
								<p style="color: #2699FB; display: inline-block;">판매가:
									${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</p></td>
						</tr>
					</table>
				</a>
			</c:forEach>
		</div>
	</div>

</main>