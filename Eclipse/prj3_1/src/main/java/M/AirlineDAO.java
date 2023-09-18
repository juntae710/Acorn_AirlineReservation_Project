package prj_airline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.batch.Main;

import user.User;

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
		//ArrayList<Country> clist= dao.airportList();
		//System.out.println(clist);
		
		String a = "괌";
		ArrayList<Airport> clist = dao.searchAirport(a);
		System.out.println(clist);
		
	}
	

}