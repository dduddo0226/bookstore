<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/c0869f519a.js"
	crossorigin="anonymous"></script>
<link href="css/main.css" rel="stylesheet">
</head>
<body>
	<%
		String center = request.getParameter("center");

		if (center == null) {
			center = "center.jsp";
		}
	%>
	<table width="1200px" />
	<tr>
		<td width="200px" height="97px"><a href="mainpage.jsp"><img alt="로고"
				src="https://bookshop.ge/images/logo.svg"></a></td>
		<td align="right" style="padding:"><jsp:include page="header.jsp" />
		</td>
	</tr>
	<tr>
		<td colspan="2"><jsp:include page="nav.jsp" /></td>
	</tr>
	<tr>
		<td colspan="2"><jsp:include page="<%=center%>" /></td>
	</tr>
	<tr>
		<td colspan="2"><jsp:include page="footer.jsp" /></td>
	</tr>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	</table>
</body>
</html>