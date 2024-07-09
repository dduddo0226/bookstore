package service;

import java.util.ArrayList;

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

	public void selectAllNewBook(HttpServletRequest request, HttpServletResponse response) {

		String[] categoryNum = { "100", "200", "300" };

		String[] categories = { "문학", "외국어", "컴퓨터" };
		request.setAttribute("categories", categories);

		ArrayList<BookDTO> bookList = new ArrayList<>();

		for (String s : categoryNum) {
			ArrayList<BookDTO> temp = dao.selectKindNewBook(s);

			for (BookDTO dto : temp) {
				bookList.add(dto);
			}
		}

		request.setAttribute("booklist", bookList);

	}

	public void detailBook(HttpServletRequest request, HttpServletResponse response) {

		int book_id = Integer.parseInt(request.getParameter("book_id"));
		
		BookDTO book = dao.detailBook(book_id);
		request.setAttribute("book", book);

	}

}
