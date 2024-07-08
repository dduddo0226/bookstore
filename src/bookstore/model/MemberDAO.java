package bookstore.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private MemberDAO(){}
	private Connection conn = null;
	private PreparedStatement pt = null;
	private ResultSet rs = null;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
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
	public int selectMember(String id,String pw) {
 int result = 0;
 try {
 conn = getConnection();
 String sql = "select count(*) from member where id=? and passwd=?";
 pt = conn.prepareStatement(sql);
 pt.setString(1, id);
 pt.setString(2, pw);
 rs = pt.executeQuery();
 if(rs.next()) {
 result = rs.getInt(1);
 }
 } catch (Exception e) {
 e.printStackTrace();
 }
 return result;	
	}
	
	
}