package prj3_1;

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
	public ArrayList<Schedule> getSchedule(String dep, String arr,String date)
	{
		Connection con = dbcon();
		String sql = " select f.fcode, f.departure,f.arrival,f.sday,f.eday,f.stime,f.etime,f.airnum,a.airname,a.econum,a.businessnum"
	   		       + " from flight_prj3 f"
	   		       + " join aircraft_prj3 a"
	   		       + " on f.airnum=a.airnum"
	   		       + " where f.departure=? and f.arrival=? and f.sday=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Schedule> sList = new ArrayList<>();
		
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
				String airname = rs.getString(9);
				int econum = rs.getInt(10);
				int bsnnum = rs.getInt(11);
				sList.add(new Schedule(fcode,departure,arriaval,sday,eday,stime,etime,airnum,airname,econum,bsnnum));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return sList;
   }
	public void updateEco(String fcode)
	{
		Connection con = dbcon();
		String sql = " UPDATE aircraft_prj3"
				   + " SET econum = econum - 1"
				   + " WHERE airnum IN ("
				   + " SELECT f.airnum"
				   + " FROM flight_prj3 f"
				   + " WHERE f.fcode = ?"
				   + ")";
				
		PreparedStatement pst = null;

		try {
			pst = con.prepareStatement(sql);
			pst.setString(1,fcode);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst);
		
   }
   public void updateBsn(String fcode)
	{
		Connection con = dbcon();
		String sql = " UPDATE aircraft_prj3"
				   + " SET BUSINESSNUM = BUSINESSNUM - 1"
				   + " WHERE airnum IN ("
				   + "    SELECT f.airnum"
				   + "    FROM flight_prj3 f"
				   + "    WHERE f.fcode = ?"
				   + ")";
				
		PreparedStatement pst = null;

		try {
			pst = con.prepareStatement(sql);
			pst.setString(1,fcode);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst);
		
   }
   public ArrayList<Seat> getAllSeat(){
	    Connection con = dbcon();
		String sql = " select *"
	   		       + " from seat_prj3";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Seat> sList = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				String seatnum = rs.getString(1);
				String seatgrade = rs.getString(2);
				String fcode= rs.getString(3);
				int seatlinse = rs.getInt(4);
				String airnum = rs.getString(5);
				int seatstate = rs.getInt(6);
				sList.add(new Seat(seatnum,seatgrade,fcode,seatlinse,airnum,seatstate));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return sList;
   }
   
   public void bookingSeat(String seat,String flightCode){
	    Connection con = dbcon();
		String sql = " update seat_prj3"
				   + " set seat_prj3.seatstate = 1"
				   + " where seat_prj3.seatnum=?  and seat_prj3.fcode=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		Seat s = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, seat);
			pst.setString(2, flightCode);
		    pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
   }
   public void insertBooking(String fno, String cid, String snum){
	    Connection con = dbcon();
		String sql = " insert into resvation_prj3 values (seq.nextval,?,?,?)";
		PreparedStatement pst = null;
	 
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fno);
			pst.setString(2, cid);
			pst.setString(3, snum);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst );
		
   }
   public int findNo(String fcode, String cid) {
	    Connection con = dbcon();
		String sql = " select * from resvation_prj3 where resvation_prj3.fcode=? and resvation_prj3.id=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		int resno = 0;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1,fcode);
			pst.setString(2, cid);
			rs = pst.executeQuery();
			while(rs.next()) {
				resno = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst,rs );
		return resno;
   }
   public ArrayList<Booking> getBooking(){
	    Connection con = dbcon();
		String sql = " select *"
	   		       + " from resvation_prj3";
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Booking> sList = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				int resno = rs.getInt(1);
				String fcode = rs.getString(2);
				String id = rs.getString(3);
				String seatnum = rs.getString(4);
				sList.add(new Booking(resno, fcode, id, seatnum));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return sList;
   }
   
	public Flight selectFlight(String id) {
		Connection con = dbcon();
		String sql = " select * from flight_prj3 where fcode=?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		Flight f = null;
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
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
			
				f = new Flight(fcode,departure,arriaval,sday,eday,stime,etime,airnum);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return f;
	}
	
	public void updateCustomer(String pasno,int resno,String cid) {
		Connection con = dbcon();
		String sql = " UPDATE customer_prj3"
				   + " SET PASNO = ?, resno = ? "
				   + " WHERE ID = ?";
		PreparedStatement pst = null;
	 
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, pasno);
			pst.setInt(2, resno);
			pst.setString(3, cid);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst);
	}
	public void setState(String seatNum) {
		Connection con = dbcon();
		String sql = " update seat_prj3"
				   + " set seatstate=1"
				   + " where SEATNUM=?";
		PreparedStatement pst = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, seatNum);	
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst );
	}
	public ArrayList<Seat> ecoSeat(String fnum){
		Connection con = dbcon();
		String sql = " select * from seat_prj3 where fcode = ? and seatgrade='이코노미석'";
	   		       
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Seat> sList = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fnum);	
			rs = pst.executeQuery();
			while(rs.next()){
				String seastnum = rs.getString(1);
				String grade = rs.getString(2);
				String fcode = rs.getString(3);
				int line =rs.getInt(4);
				String airnum = rs.getString(5);
				int state =rs.getInt(6);
				sList.add(new Seat(seastnum,grade,fcode,line,airnum,state));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return sList;
	}
	public ArrayList<Seat> bsnSeat(String fnum){
		Connection con = dbcon();
		String sql = " select * from seat_prj3 where fcode = ? and seatgrade='비즈니스석'";
	   		       
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Seat> sList = new ArrayList<>();
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, fnum);	
			rs = pst.executeQuery();
			while(rs.next()){
				String seastnum = rs.getString(1);
				String grade = rs.getString(2);
				String fcode = rs.getString(3);
				int line =rs.getInt(4);
				String airnum = rs.getString(5);
				int state =rs.getInt(6);
				sList.add(new Seat(seastnum,grade,fcode,line,airnum,state));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		close(con, pst, rs);
		return sList;
	}
	public void deleteCus(int res) {
		Connection con = dbcon();
		String sql = " update customer_prj3"
				   + " set resno = 0"
				   + " where resno=?";
		PreparedStatement pst = null;
	 
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, res);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst);
	}
	
	public void deleteSeat(int res) {
		Connection con = dbcon();
		String sql = "update seat_prj3"
				   + " set seatstate=0"
				   + " where SEATNUM= (select seatnum from resvation_prj3 where resno=?)";
		PreparedStatement pst = null;
	 
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, res);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(con, pst);
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
		
		//ArrayList<Flight> flist = dao.getFlight("인천", "부산","2023-09-22");
		//System.out.println(flist);
		//ArrayList<Seat> sLsit = dao.getAllSeat();
		////System.out.println(sLsit);
		//Flight s = dao.selectFlight("AC0101");
		//System.out.println(s.toString());
		//dao.insertBooking("AC0101", "test01", "1B");
	    //ArrayList<Booking> s = dao.getBooking();
		//System.out.println(s);
		int result = dao.findNo("AC0101", "test01");
		ArrayList<Seat> s = dao.ecoSeat("AC0101");
		
		System.out.println(s);
		
	}
	

}