<%@page import="bookstore.model.BookDAO"%>
<%@page import="bookstore.model.BookDTO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main>
	<h2>신간 소개</h2>
	<!-- 책가져오는 포이치 -->

	<div class="list-box">
		<h3>
			제목
		</h3>
		<div class="list-box-inner">
			<!-- 신간3개 포이치 -->

			<a href="mainpage.jsp?center=book/bookinfo.jsp?book_id=1 ">
				<table width="400px">
					<tr>
						<td rowspan="5" width="150px" height="200px"><img alt="사진"
							src="images/01.jpg" width="100%"
							height="100%"></td>
					</tr>
					<tr>
						<td width="200px">제목입니당</td>
					</tr>
					<tr>
						<td width="200px">출판사 :</td>
					</tr>
					<tr>
						<td width="200px">저자 :</td>
					</tr>
					<tr>
						<td width="200px"><del>정가: 원</del><br /><p style="color:#2699FB;">
							판매가:원</p>
						</td>
					</tr>
				</table>
			</a>
	
		</div>
		<div class="addButton">
			<button type="button" class="btn btn-light" onclick="location.href='mainpage.jsp?center=book/categorybook.jsp?option=1&category=100'">더보기</button>
		</div>
	</div>


</main>