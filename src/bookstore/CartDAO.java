package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			 pt.setInt(1, seq);
			 pt.setString(2, cartBook.getBuyer());
			 pt.setInt(3, cartBook.getBook_id());
			 pt.setString(4, cartBook.getBook_title());
			 pt.setInt(5, cartBook.getBuy_price());
			 pt.setInt(6, cartBook.getBuy_count());
			 pt.setString(7, cartBook.getBook_image());
			 
			 pt.executeUpdate();
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<CartDTO> selectAllCart() {
		ArrayList<CartDTO>cartList = new ArrayList<CartDTO>();
		try {
			conn=getConnection();
			 String sql = "select * from cart";
			 pt = conn.prepareStatement(sql);
			 rs = pt.executeQuery();
			 if(rs.next()) {
				 do {
					CartDTO cart = new CartDTO(rs.getInt(1), rs.getString(2),
							rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7));
					 cartList.add(cart);
				 }while(rs.next()); 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cartList;
	}
}
