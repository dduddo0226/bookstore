package bookstore.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private BookDAO(){}
	
	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;
	
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	private Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/bookstoredb05?serverTimezone=UTC";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
/*********************************** 책 한권의 정보(book_id) **********************************************/
	public BookDTO detailBook(int book_id) {
		BookDTO book = null;
		try {
			conn = getConnection();
			String sql = "SELECT * from book where book_id = ?";
			pt = conn.prepareStatement(sql);
			pt.setInt(1, book_id);
			rs = pt.executeQuery();
			if (rs.next()) {
				book = new BookDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getInt(11), rs.getString(12));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;

	}
/*************************************** 최신순 전체조회 ******************************************************/
	public ArrayList<BookDTO> selectAllNewBook(){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book ORDER BY publishing_date DESC";
			pt = conn.prepareStatement(sql);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;
	}
/*************************************** 최신순 분류별 ******************************************************/	
	public ArrayList<BookDTO> selectKindNewBook(String kind){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book WHERE book_kind= ? ORDER BY publishing_date DESC";
			pt = conn.prepareStatement(sql);
			pt.setString(1, kind);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;	
	}
/*************************************** 가나다순 전체조회 ******************************************************/
	public ArrayList<BookDTO> selectAllNameBook(){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book ORDER BY book_title";
			pt = conn.prepareStatement(sql);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;
	}
/*************************************** 가나다순 분류별 ******************************************************/	
	public ArrayList<BookDTO> selectKindNameBook(String kind){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book WHERE book_kind= ? ORDER BY book_title";
			pt = conn.prepareStatement(sql);
			pt.setString(1, kind);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;	
	}
/*************************************** 할인률 높은순 전체조회 ******************************************************/
	public ArrayList<BookDTO> selectAllDiscountBook(){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book ORDER BY discount_rate DESC";
			pt = conn.prepareStatement(sql);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;
	}
/*************************************** 할인률 높은순 분류별 ******************************************************/	
	public ArrayList<BookDTO> selectkindDiscountBook(String kind){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book WHERE book_kind= ? ORDER BY discount_rate DESC";
			pt = conn.prepareStatement(sql);
			pt.setString(1, kind);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;	
	}
/*************************************** 최종가 높은순 전체조회 ******************************************************/
	public ArrayList<BookDTO> selectAllUpPriceBook(){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book ORDER BY book_price*(1-(discount_rate/100)) DESC";
			pt = conn.prepareStatement(sql);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;
	}
/*************************************** 최종가 높은순 분류별 ******************************************************/	
	public ArrayList<BookDTO> selectkindUpPriceBook(String kind){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book WHERE book_kind= ? ORDER BY book_price*(1-(discount_rate/100)) DESC";
			pt = conn.prepareStatement(sql);
			pt.setString(1, kind);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;	
	}
/*************************************** 최종가 낮은순 전체조회 ******************************************************/
	public ArrayList<BookDTO> selectAllDownPriceBook(){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book ORDER BY book_price*(1-(discount_rate/100))";
			pt = conn.prepareStatement(sql);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;
	}	
/*************************************** 최종가 낮은순 분류별 ******************************************************/	
	public ArrayList<BookDTO> selectkindDownPriceBook(String kind){
		ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM book WHERE book_kind= ? ORDER BY book_price*(1-(discount_rate/100))";
			pt = conn.prepareStatement(sql);
			pt.setString(1, kind);
			rs=pt.executeQuery();
			if(rs.next()) {
				do {
					BookDTO book = new BookDTO(rs.getInt(1),
							rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
							rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
							rs.getString(10),rs.getInt(11),rs.getString(12));
					bookList.add(book);
				}while(rs.next());
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return bookList;	
	}

	public ArrayList<BookDTO> searchBook(String search){
		 ArrayList<BookDTO> bookList = new ArrayList<BookDTO>();
		 try {
		 conn = getConnection();
		 String sql = "SELECT * FROM book where book_title like ?";
		 pt = conn.prepareStatement(sql);
		 pt.setString(1,"%" + search + "%");
		 rs=pt.executeQuery();
		 if(rs.next()) {
		 do {
		 BookDTO book = new BookDTO(rs.getInt(1),
		 rs.getString(2),rs.getString(3),rs.getInt(4),rs.getInt(5),
		 rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),
		 rs.getString(10),rs.getInt(11),rs.getString(12));
		 bookList.add(book);
		 }while(rs.next());
		 } 
		 } catch (Exception e) {
		 e.printStackTrace();
		 }	
		 return bookList;
			}
}
