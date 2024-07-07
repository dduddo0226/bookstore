<%@page import="bookstore.BookDAO"%>
<%@page import="bookstore.BookDTO"%>
<%@page import="bookstore.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookstore.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main class="cartlist-box">
	<table class="table">
		<thead>
			<tr class="table-dark">
				<th scope="col">번호</th>
				<th scope="col" colspan="2">상품정보</th>
				<th scope="col">수량</th>
				<th scope="col">상품금액</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				ArrayList<CartDTO> cartlist = CartDAO.getInstance().selectAllCart();
				int idx = 1;
				for (CartDTO cart : cartlist) {
					BookDTO book = BookDAO.getInstance().detailBook(cart.getBook_id());
			%>
			<tr>
				<td><p style="font-size: 15px"><%=idx++%></p></td>
				<td align="center"><img alt="사진"
					src="images/<%=cart.getBook_image()%>" width="80px" height="127px"></td>
				<td>
					<h5><strong><%=book.getBook_title() %></strong></h5>
					<p style="font-size: 15px"><%=book.getBook_content()%></p>
				</td>
				<td>
					<form action="#" method="post">
						<input type="hidden" name="book_id" value="">
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
				</td>
				<td><%=cart.getBuy_price()%>원</td>
				<td><input type="hidden" name="cart_id"
					value="<%=cart.getCart_id()%>" />
					<button type="button" class="btn btn-outline-secondary"
						onclick="location.href='deletecartlist.jsp?cart_id=<%=cart.getCart_id()%>'">삭제</button>
					</form></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</main>