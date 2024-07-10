package bookstore.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BookService;

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

		BookService service = BookService.getInstance();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String url = request.getRequestURI();

		String contextPath = request.getContextPath();

		String context = url.substring(contextPath.length());

		String viewpage = "/WEB-INF/mainpage";

		
		switch (context) {

		case "/home.sha":

			service.selectKindNewBook(request, response);
			request.setAttribute("center", "/WEB-INF/book/latestlist.jsp");
			break;

		case "/bookinfo.sha":

			service.detailBook(request,response);
			
			request.setAttribute("center", "/WEB-INF/book/bookinfo.jsp");
			break;

		default:
			break;

		}

		viewpage += ".jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);

	}

}
