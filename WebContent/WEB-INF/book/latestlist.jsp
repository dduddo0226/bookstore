<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main>
	<h2>신간 소개</h2>
		<c:forEach var="entry" items="${kindNewBook}">
	<div class="latest-list">
			<h3>${entry.key}</h3>
			<div class="list-box">
				<c:forEach var="book" items="${entry.value}" begin="1" end="3">
					<a href="bookinfo.sha?book_id=${book.book_id}"
						class="list-box-inner"> <img class="inner-img"
						src="images/${book.book_image}" alt="">
						<div class="box-inner-detail">
							<h3>${book.book_title}</h3>
							<p>출판사 : ${book.publishing_com}</p>
							<p>저자 : ${book.author}</p>
							<del>정가 : ${book.book_price}원</del>
							<p class="sale-price">판매가 :
								${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</p>
						</div>
					</a>
				</c:forEach>
	</div>
	<div class="addButton">
			<button type="button" class="btn btn-light"
				onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=100'">더보기
			</button>
		</div>
	</div>
		</c:forEach>

</main>