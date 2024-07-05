package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {
	private CartDAO() {
	}

	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;
	private static CartDAO instance = new CartDAO();
	public static CartDAO getInstance() {
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
	
	public void insertCart(CartDTO cartBook) {
		try {
			conn=getConnection();
			 int seq = 1;
			 String sql = "select MAX(cart_id) from cart";
			 pt = conn.prepareStatement(sql);
			 rs = pt.executeQuery();
			 if(rs.next()) {
				 seq = rs.getInt(1) +1;
				  }
			 sql = "INSERT INTO cart (cart_id, buyer, book_id, book_title, buy_price, buy_count, book_image) VALUES (?,?,?,?,?,?,?)";
			 pt = conn.prepareStatement(sql);
		//pt에 값 세팅하기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
