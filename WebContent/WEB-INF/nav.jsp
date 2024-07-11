<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary"
	data-bs-theme="dark">
	<div class="container container-fluid">
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="book.sha?sort=1">전체목록보기</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="mainpage.jsp?center=book/categorybook.jsp?category=100&option=1">문학</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					href="mainpage.jsp?center=book/categorybook.jsp?category=200&option=1">외국어</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="mainpage.jsp?center=book/categorybook.jsp?category=300&option=1">컴퓨터</a></li>
			</ul>
			<div>
				<form action="mainpage.jsp?center=searchbook.jsp" class="d-flex"
					role="search" method="post">
					<input name="search" class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-light" type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</nav>