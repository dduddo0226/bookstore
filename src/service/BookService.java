package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookstore.model.BookDAO;
import bookstore.model.BookDTO;

public class BookService {

	private static BookService instance = new BookService();

	private BookService() {
	}

	public static BookService getInstance() {
		return instance;
	}

	private BookDAO dao = BookDAO.getInstance();

	public void selectKindNewBook(HttpServletRequest request, HttpServletResponse response) {
		String[] categoryNum = { "100", "200", "300" };

		String[] categories = { "문학", "외국어", "컴퓨터" };
		Map<String, ArrayList<BookDTO>> kindNewBook = new HashMap<String, ArrayList<BookDTO>>();

		for (int i = 0; i < categoryNum.length; i++) {
			kindNewBook.put(categories[i], dao.selectKindNewBook(categoryNum[i]));
		}
		request.setAttribute("kindNewBook", kindNewBook);
	}

	public void detailBook(HttpServletRequest request, HttpServletResponse response) {

		int book_id = Integer.parseInt(request.getParameter("book_id"));

		BookDTO book = dao.detailBook(book_id);
		request.setAttribute("book", book);

	}

	public void selectAllNewBook(HttpServletRequest request, HttpServletResponse response) {

		String sort = request.getParameter("sort");

		ArrayList<BookDTO> booklist = new ArrayList<BookDTO>();

		switch (sort) {
		case "1":
			booklist = dao.selectAllNewBook();
			break;
		case "2":
			booklist = dao.selectAllNameBook();
			break;
		case "3":
			booklist = dao.selectAllDiscountBook();
			break;
		case "4":
			booklist = dao.selectAllUpPriceBook();
			break;
		case "5":
			booklist = dao.selectAllDownPriceBook();
			break;
		default:
			break;
		}
		request.setAttribute("booklist", booklist);

	}

}
