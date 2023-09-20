package prj_airline;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.batch.Main;


public class AirlineDAO {
	String driver = "oracle.jdbc.driver.OracleDriver" ;
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
	
	public ArrayList<Airport> airportList() {
		Connection con = dbcon();
		String sql = "select * from airport";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Airport> clist = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				String city = rs.getString(1);
				String code = rs.getString(2);
				String country = rs.getString(3);
				String continet = rs.getString(4);
				clist.add(new Airport(city,code,country,continet));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clist;
	}
	public ArrayList<Airport> searchAirport(String airportText){
		String sql= "  SELECT code, city, country"
				  + "  FROM airport"
				  + "  WHERE code LIKE ?"
				  + "  OR city LIKE ?"
				  + "  OR country LIKE ?";
		ArrayList<Airport> airportList = new ArrayList<>();
		Connection con = dbcon();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement(sql);
			String searchText = "%" + airportText + "%";
			pst.setString(1, searchText);
			pst.setString(2, searchText);
			pst.setString(3, searchText);
			rs = pst.executeQuery();
			while(rs.next()) {
				String city = rs.getString(1);
				String code = rs.getString(2);
				String country = rs.getString(3);
				airportList.add(new Airport(city,code,country));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst, rs);
		return airportList;
	}
	public ArrayList<Flight> getFlight(String dep, String arr,String date)
	{
		Connection con = dbcon();
		String sql = " SELECT *"
				   + " from flight_prj3"
				   + " where departure =? and arrival =?  and sday=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Flight> allFlight = new ArrayList<>();
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, dep);
			pst.setString(2, arr);
			pst.setString(3, date);
			rs = pst.executeQuery();
			while(rs.next()){
				String fcode = rs.getString(1);
				String departure = rs.getString(2);
				String arriaval = rs.getString(3);
				Date sday = rs.getDate(4);
				Date eday = rs.getDate(5);
				String stime = rs.getString(6);
				String etime = rs.getString(7);
				String airnum = rs.getString(8);
				allFlight.add(new Flight(fcode,departure,arriaval,sday,eday,stime,etime,airnum));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return allFlight;
   }
	
	
	
	
	
	
	public void close( AutoCloseable ...a) {
		for( AutoCloseable  item : a) {
		   try {
			item.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		}
		
	}
	public static void main(String args[]) {
		AirlineDAO dao = new AirlineDAO();
		//ArrayList<Airport> clist= dao.airportList();
		//System.out.println(clist);
		
		//String a = "괌";
		//ArrayList<Airport> clist = dao.searchAirport(a);
		//System.out.println(clist);
		
		ArrayList<Flight> flist = dao.getFlight("인천", "부산","2023-09-22");
		System.out.println(flist);
		
	}
	

}