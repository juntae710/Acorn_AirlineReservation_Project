package ptj3_1team;

import java.sql.*;
import java.util.ArrayList;


public class P_DAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";
	
	public Connection dbcon() {
		//데이터 베이스 연결
		Connection  con=null;
	
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			if(con!=null) System.out.println("ok");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
		
	}

	
	
	public void close(AutoCloseable ...a) {
		//닫기
		for(AutoCloseable item: a) {
			try {
				item.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	public P_Customer selectidpw (String id) {
		//db연결
		Connection con = dbcon();
		//sql
		String sql = "select id , pw, name, phone, gender from customer_prj3 where id = ?";
		PreparedStatement pst = null;
			ResultSet	rs = null;
			P_Customer c = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			//sql 실행
			//sql 싱행 결과 Customer 객체로 만들기
			rs=pst.executeQuery();
			if(rs.next()) {
				String id_tmp = rs.getString(1);
				String pw_tmp = rs.getString(2);
				String name_tmp = rs.getString(3);
				String phone_tmp = rs.getString(4);
				String gender_tmp = rs.getString(5);
				
				 c = new P_Customer(id_tmp, pw_tmp, name_tmp,phone_tmp,gender_tmp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//자원해제
		close(rs,pst,con);
		
		return c;
		
	}
	
	

	public void updateMember(P_Customer c) {
		//연결
		//변경 sql작성
		//실행
		//자원반납
		Connection con =dbcon();
		PreparedStatement pst = null;
		String sql = "update CUSTOMER_PRJ3 set pw=?, phone=? where id=?";
		try {
			pst =con.prepareStatement(sql);
			pst.setString(1, c.getPw());
			pst.setString(2, c.getPhone());
			pst.setString(3, c.getId());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst,con);
	}
	
	public ArrayList<P_ResUD> selectRes (String id) {
		//db연결
		Connection con = dbcon();
		//sql
		String sql = "select r.RESNO,r.FCODE,f.DEPARTURE,f.ARRIVAL,substr(f.SDAY, 1,10),substr(f.EDAY, 1,10),f.STIME,f.ETIME,a.AIRNUM,a.AIRNAME\r\n"
				+ "from flight_prj3 f join aircraft_prj3 a on f.AIRNUM = a.AIRNUM join resvation_prj3 r on r.FCODE = f.FCODE where id = ?";
		ArrayList<P_ResUD> list = new ArrayList<>();
		PreparedStatement pst = null;
			ResultSet	rs = null;
			 
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			//sql 실행
			//sql 싱행 결과 Customer 객체로 만들기
			rs=pst.executeQuery();
			while(rs.next()) {
				String resno = rs.getString(1);
				String fcode = rs.getString(2);
				String departure = rs.getString(3);
				String arrival = rs.getString(4);
				String sday = rs.getString(5);
				String eday = rs.getString(6);
				String stime = rs.getString(7);
				String etime = rs.getString(8);
				String airnum = rs.getString(9);
				String airname = rs.getString(10);
				
				P_ResUD r = new P_ResUD(resno, fcode, departure, arrival, sday, eday, stime, etime, airnum, airname);
				 list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//자원해제
		close(rs,pst,con);
		
		return list;
		
	}
	
	

	public void updateRes(P_ResUD r) {
		//연결
		//변경 sql작성
		//실행
		//자원반납
		Connection con =dbcon();
		PreparedStatement pst = null;
		String sql = "update flight_prj3 set SDAY= ? ,EDAY= ? ,STIME= ? ,ETIME= ? where fcode= ?";
		try {
			pst =con.prepareStatement(sql);
			pst.setString(1, r.getSday());
			pst.setString(2, r.getEday());
			pst.setString(3, r.getStime());
			pst.setString(4, r.getEtime());
			pst.setString(5, r.getFcode());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst,con);
	}
public static void main(String[] args) {
	P_DAO d = new P_DAO();
	ArrayList<P_ResUD> arr =  d.selectRes("test01");
	for(int i = 0; i<arr.size(); i++) {
		
		System.out.println(arr.get(i));
	}
}
}
