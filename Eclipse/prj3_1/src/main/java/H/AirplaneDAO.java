package H;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

<<<<<<< HEAD
import H.LoginDTO;
=======
import prj3_1.LoginDTO;
>>>>>>> 333a6ac44189fb8523cd1728dd3e42f59caf818d

public class AirplaneDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";

	public Connection dbcon() {

		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			if (con != null)
				System.out.println("ok");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public void close(AutoCloseable... a) {

		for (AutoCloseable item : a) {
			try {
				item.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public boolean selectIP(String inputId, String inputPw) {
	    Connection con = dbcon();
	    PreparedStatement pst = null;
	    ResultSet rs = null;

	    LoginDTO airplane = null;

	    try {
	    	String sql = "select id, pw from customer_prj3 where id = ?";
	        pst = con.prepareStatement(sql);
	        pst.setString(1, inputId);
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            String id = rs.getString("id");
	            String pw = rs.getString("pw");
	            if(inputPw.equals(pw)){
	            	return true;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    close(rs, pst, con);
	    return false;
	}
}
