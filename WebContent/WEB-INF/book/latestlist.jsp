<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main>

	<h2>신간 소개</h2>
	<div class="list-box">
		<h3>${categories[0]}</h3>
		<c:forEach var="book" items="${booklist}" begin="1" end="3">
			<div class="list-box-inner">
				<a href="bookinfo.sha?book_id=${book.book_id}">
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
							<td width="200px"><del>정가: ${book.book_price}원</del><br />
								<p style="color: #2699FB;">판매가:
									${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</p></td>
						</tr>
					</table>
				</a>
			</div>
		</c:forEach>
		<div class="addButton">
			<button type="button" class="btn btn-light"
				onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=100'">더보기
			</button>
		</div>
	</div>

	<div class="list-box">
		<h3>${categories[1]}</h3>
		<c:forEach var="book" items="${booklist}" begin="4" end="6">
			<div class="list-box-inner">
				<a href="bookinfo.sha?book_id=${book.book_id}">
					<table width="400px">
						<tr>
							<td rowspan="5" width="150px" height="200px"><img alt="사진"
								src="images/${book.book_image}" width="100%" height="100%"></td>
						</tr>
						<tr>
							<td width="200px">${book.book_title }</td>
						</tr>
						<tr>
							<td width="200px">출판사 : ${book.publishing_com}</td>
						</tr>
						<tr>
							<td width="200px">저자 : ${book.author}</td>
						</tr>
						<tr>
							<td width="200px"><del>정가: ${book.book_price}원</del><br />
								<p style="color: #2699FB;">판매가:
									${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</p></td>
						</tr>
					</table>
				</a>
			</div>
		</c:forEach>
		<div class="addButton">
			<button type="button" class="btn btn-light"
				onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=100'">더보기
			</button>
		</div>
	</div>

	<div class="list-box">
		<h3>${categories[2]}</h3>
		<c:forEach var="book" items="${booklist}" begin="7" end="9">
			<div class="list-box-inner">
				<a href="bookinfo.sha?book_id=${book.book_id}">
					<table width="400px">
						<tr>
							<td rowspan="5" width="150px" height="200px"><img alt="사진"
								src="images/${book.book_image}" width="100%" height="100%"></td>
						</tr>
						<tr>
							<td width="200px">${book.book_title }</td>
						</tr>
						<tr>
							<td width="200px">출판사 : ${book.publishing_com}</td>
						</tr>
						<tr>
							<td width="200px">저자 : ${book.author}</td>
						</tr>
						<tr>
							<td width="200px"><del>정가: ${book.book_price}원</del><br />
								<p style="color: #2699FB;">판매가:
									${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</p></td>
						</tr>
					</table>
				</a>
			</div>
		</c:forEach>
		<div class="addButton">
			<button type="button" class="btn btn-light"
				onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=100'">더보기
			</button>
		</div>
	</div>
</main>