package bookstore.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookstore.model.BookDAO;
import bookstore.model.BookDTO;

@WebServlet("/book")
public class bookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

		int option = Integer.parseInt(request.getParameter("option"));

		ArrayList<BookDTO> booklist = BookDAO.getInstance().selectAllNewBook();
		
		
		switch (option) {

		case 1:
			booklist = BookDAO.getInstance().selectAllNewBook();
			break;
		case 2:
			booklist = BookDAO.getInstance().selectAllNameBook();
			break;
		case 3:
			booklist = BookDAO.getInstance().selectAllDiscountBook();
			break;
		case 4:
			booklist = BookDAO.getInstance().selectAllUpPriceBook();
			break;
		case 5:
			booklist = BookDAO.getInstance().selectAllDownPriceBook();
			break;
		}

		request.setAttribute("booklist", booklist);
		
		RequestDispatcher dis = request.getRequestDispatcher("/mainpage.jsp?center=book/allbooklist.jsp");
		dis.forward(request, response);
	}

}
