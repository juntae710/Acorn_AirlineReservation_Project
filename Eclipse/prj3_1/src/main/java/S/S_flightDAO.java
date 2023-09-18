package prj0918프로젝트연습;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class S_flightDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";
	
	public Connection db() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			if(con!=null) {
				System.out.print("ok");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(AutoCloseable...autoCloseables) {
		for(AutoCloseable item : autoCloseables) {
			try {
				item.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Flight> selectcheck(String fcode){
		Connection con = db();
		String sql = "select * from flight_prj3 where fcode=?";
		PreparedStatement  pst = null;
		ResultSet rs = 	null;	
		ArrayList<Flight> list = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fcode);
			rs = pst.executeQuery();
			while(rs.next()) {
				
				
				String departure = rs.getString(2);
				String arrival = rs.getString(3);
				String sday = rs.getString(4);
				String eday = rs.getString(5);
				String stime = rs.getString(6);
				String etime = rs.getString(7);
				String airnum = rs.getString(8);
				list.add(new Flight(fcode,departure,arrival,sday,eday,stime,etime,airnum));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,con,pst);
		return list;
		
	}
	
	public void deleteFlightinfo(String fcode) {
		Connection con = db();
		String sql = "delete * from flight_prj3 where fcode=?";
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fcode);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con,pst);
	}
}
