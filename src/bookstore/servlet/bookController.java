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

@WebServlet("*.sha")
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
		request.setCharacterEncoding("UTF-8");
		String[] kindList = { "100", "200", "300" };
		String[] kindName = { "문학", "외국어", "컴퓨터" };
		
		
		
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
		
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/mainpage.jsp?center=book/allbooklist.jsp");
		dis.forward(request, response);
	}

}
