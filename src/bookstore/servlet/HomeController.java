package bookstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.sha")
public class HomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String url = request.getRequestURI();

		String contextPath = request.getContextPath();

		String context = url.substring(contextPath.length());

		String viewpage = "/WEB-INF/";

		switch (context) {
		case "/home.sha":
			viewpage += "mainpage";
			break;

		default:
			break;
		}

		viewpage += ".jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);

	}

}
