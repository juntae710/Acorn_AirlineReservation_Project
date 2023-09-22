package prj3_1;



import java.io.Closeable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.DefaultRowSorter;



public class L_joinDAO {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:testdb";
	String user="scott";
	String password="tiger";
	
	public Connection dbcon() {		 
		Connection con = null;
		try {
			Class.forName(driver);
			con =DriverManager.getConnection(url, user, password);
			if( con != null) System.out.println( "ok");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;		 	
	}
	
	
	public ArrayList<L_Customer> selectAll() {
		
		Connection connection = dbcon();
		
		String sql = "select * from customer_prj3";
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		
		ArrayList<L_Customer> list = new ArrayList<>();
		
		
		try {
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				int resno = rs.getInt(5);
				String pasno = rs.getString(6);
				String gender = rs.getString(7);
				L_Customer c = new L_Customer(id, pw, name, phone, resno, pasno, gender);
				list.add(c );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, rs, connection);
		return list;
		
		
	}
public L_Customer selectCustomer(String inputid) {
		
		Connection connection = dbcon();
		
		String sql = "select * from customer_prj3 where id=?";
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		L_Customer c = null;
		try {
			pst = connection.prepareStatement(sql);
			pst.setString(1,inputid);
			rs = pst.executeQuery();
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				int resno = rs.getInt(5);
				String pasno = rs.getString(6);
				String gender = rs.getString(7);
				c = new L_Customer(id, pw, name, phone, resno, pasno, gender);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, rs, connection);
		return c;
		
		
	}
	
	public void insert(L_Customer customer) throws SQLException {
		
		
		Connection connection = dbcon();
		String sql = "insert into customer_prj3(id, pw, name, phone, gender) values(?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, customer.getId());
			pst.setString(2, customer.getPw());
			pst.setString(3, customer.getName());
			pst.setString(4, customer.getPhone());
			pst.setString(5, customer.getGender());
			
			pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			
			throw e;
		}
		

		
	}
	
    public  boolean selectOne(String id) {
		
		//db 연결
		Connection connection = dbcon();
		
		//sql
		String sql = "select id from customer_prj3 where id = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		L_Customer customer = null;
		
		
		try {
			pst = connection.prepareStatement(sql);
			pst.setString(1, id);
			
			
			rs = pst.executeQuery();
			
			
			if (rs.next()) {
				String id_tmp = rs.getString(1);
				customer = new L_Customer(id_tmp);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, connection);
		return false;
		
	}
	
	
	
	

	public void close(AutoCloseable ...a) {
		for(AutoCloseable item: a) {
			try {
				item.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public boolean checkId(String id) {
	    Connection con = dbcon();
	    String sql = "select id from customer_prj3 where id = ?";
	    PreparedStatement pst = null;
	    ResultSet rs = null;

	    try {
	        pst = con.prepareStatement(sql);
	        pst.setString(1, id);
	        rs = pst.executeQuery();

	        if (rs.next()) {
	            return true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs, pst, con);
	    }

	    return false;
	}
    

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		L_joinDAO dao = new L_joinDAO();
		//ArrayList<Customer> c = dao.selectAll();
		//for(Customer cc : c) {
		//	System.out.println(cc );
		//}
		L_Customer c = new L_Customer("test02", "pw4567", "김이", "01012345678", "W");
		try {
			dao.insert(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println( c);
		

	}

}
