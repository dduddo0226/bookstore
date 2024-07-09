<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main class="section">
	<div class="bookinfo-box">
		<div class="bookimg-box">
			<img alt="사진" src="images/${book.book_image}" width="100%"
				height="100%">
		</div>
		<div class="bookpay-box">
			<div id="booktitle">
				${book.book_title}
			</div>
			<div>
				<span id="discount">${book.discount_rate}%</span><span>${String.format("%.0f",(book.book_price / 100) * (100 - book.discount_rate))}원</span><span
					id="disprice"><del>${book.book_price}원
					</del></span>
			</div>
			<div>
				<p>${book.author}
					저자(글)
				</p>
				<p>${book.publishing_com}
					|
					${book.publishing_date}</p>
			</div>
			<div>
				<p style="font-size: 18px">
					<strong>상세설명</strong>
				</p>
				<p>${book.book_content}</p>
			</div>
			<div>
				<form action="cart/cartupdate.jsp" method="post">
					<input type="hidden" name="book_id" value="${book.book_id}">
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
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='#'">목록으로</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='home.sha'">메인으로</button>
				</form>
			</div>
		</div>
	</div>
</main>