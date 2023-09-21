package prj3_1;

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
	/*
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
	*/
	
	public void deleteFlightinfo(String resno) {
		Connection con = db();
		String sql = "DELETE FROM resvation_prj3 r " +
	             "WHERE r.RESNO = ? " +
	             "AND EXISTS (SELECT 1 FROM flight_prj3 f " +
	             "            WHERE r.FCODE = f.FCODE " +
	             "            AND EXISTS (SELECT 1 FROM aircraft_prj3 a " +
	             "                        WHERE f.airnum = a.airnum))";
				
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, resno);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con,pst);
	}
	/*
	 public Flight selectonecheck(String fcode) {
		 
		 Connection con = db();
		 String sql = "select * from flight_prj3 where fcode=?";
		 PreparedStatement  pst = null;
		 ResultSet rs = null;
		 Flight f = null;
		 try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fcode);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				
				String fcode_tmp = rs.getString(1);
				String departure_tmp = rs.getString(2);
				String arrival_tmp = rs.getString(3);
				String sday_tmp = rs.getString(4);
				String eday_tmp = rs.getString(5);
				String stime_tmp = rs.getString(6);
				String etime_tmp = rs.getString(7);
				String airnum_tmp = rs.getString(8);
				f = new Flight(fcode_tmp,departure_tmp,arrival_tmp,sday_tmp,eday_tmp,stime_tmp,etime_tmp,airnum_tmp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 close(rs,pst,con);
		return f;
	 }
	 */
	
	public Flight2 selectonecheck(String resno) {
		Connection con = db();
		String sql = " select r.RESNO,r.FCODE,f.DEPARTURE,f.ARRIVAL,substr(f.SDAY, 1,10),substr(f.EDAY, 1,10),f.STIME,f.ETIME,a.AIRNUM,a.AIRNAME"
	            +" from flight_prj3 f join aircraft_prj3 a on f.AIRNUM = a.AIRNUM join resvation_prj3 r on r.FCODE = f.FCODE where resno = ?";
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		Flight2 f = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, resno);
			rs = pst.executeQuery();
			if(rs.next()) {
				String resno_tmp = rs.getString(1);
				String fcode_tmp = rs.getString(2);
				String DEPARTURE_tmp = rs.getString(3);
				String ARRIVAL_tmp = rs.getString(4);
				String SDAY_tmp = rs.getString(5);
				String EDAY_tmp = rs.getString(6);
				String STIME_tmp = rs.getString(7);
				String ETIME_tmp = rs.getString(8);
				String AIRNUM_tmp = rs.getString(9);
				String AIRNAME_tmp = rs.getString(10);
				
				f = new Flight2(resno_tmp,fcode_tmp,DEPARTURE_tmp,ARRIVAL_tmp,SDAY_tmp,EDAY_tmp,STIME_tmp,ETIME_tmp,AIRNUM_tmp,AIRNAME_tmp);
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs,con,pst);
		return f;

	}
	 	
	 
	
}
