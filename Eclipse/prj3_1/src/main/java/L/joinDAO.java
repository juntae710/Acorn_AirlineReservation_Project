package join;


import java.io.Closeable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.DefaultRowSorter;



public class joinDAO {
	
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
	
	
	public ArrayList<Customer> selectAll() {
		
		Connection connection = dbcon();
		
		String sql = "select * from customer_prj3";
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		
		ArrayList<Customer> list = new ArrayList<>();
		
		
		try {
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String phone = rs.getString(4);
				String resno = rs.getString(5);
				String pasno = rs.getString(6);
				String gender = rs.getString(7);
				Customer c = new Customer(id, pw, name, phone, resno, pasno, gender);
				list.add(c );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(pst, rs, connection);
		return list;
		
		
	}
	
	
	public void insert(Customer customer) throws SQLException {
		
		
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
	
	
	public Customer selectOne(String id) {
		
		//db 연결
		Connection connection = dbcon();
		
		//sql
		String sql = "select * from customer_prj3 where id = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		Customer customer = null;
		
		
		try {
			pst = connection.prepareStatement(sql);
			pst.setString(1, id);
			
			
			rs = pst.executeQuery();
			
			
			if (rs.next()) {
				String id_tmp = rs.getString(1);
				customer = new Customer(id_tmp);
				return customer;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close(rs, pst, connection);
		return customer;
		
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


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		joinDAO dao = new joinDAO();
		//ArrayList<Customer> c = dao.selectAll();
		//for(Customer cc : c) {
		//	System.out.println(cc );
		//}
		/*Customer c = new Customer("test02", "pw4567", "김이", "01012345678", "W");
		try {
			dao.insert(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println( c);
		*/
		
		Customer c1 = dao.selectOne("testtest55");
		System.out.println(c1);
		

	}

}
