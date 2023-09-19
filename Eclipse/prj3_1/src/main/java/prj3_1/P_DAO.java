package prj3_1;

import java.sql.*;
import java.util.ArrayList;

public class P_DAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";

	public Connection dbcon() {
		// 데이터 베이스 연결
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
		// 닫기
		for (AutoCloseable item : a) {
			try {
				item.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public P_Customer selectidpw(String id) {
		// db연결
		Connection con = dbcon();
		// sql
		String sql = "select id , pw, name, phone, gender from customer_prj3 where id = ?";
		PreparedStatement pst = null;
		ResultSet rs = null;
		P_Customer c = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			// sql 실행
			// sql 싱행 결과 Customer 객체로 만들기
			rs = pst.executeQuery();
			if (rs.next()) {
				String id_tmp = rs.getString(1);
				String pw_tmp = rs.getString(2);
				String name_tmp = rs.getString(3);
				String phone_tmp = rs.getString(4);
				String gender_tmp = rs.getString(5);

				c = new P_Customer(id_tmp, pw_tmp, name_tmp, phone_tmp, gender_tmp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 자원해제
		close(rs, pst, con);

		return c;

	}

	public void updateMember(P_Customer c) {
		// 연결
		// 변경 sql작성
		// 실행
		// 자원반납
		
		
		System.out.println(c.toString());
		Connection con = dbcon();
		PreparedStatement pst = null;
		String sql = "update CUSTOMER_PRJ3 set pw=?, phone=? where id=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, c.getPw());
			pst.setString(2, c.getPhone());
			pst.setString(3, c.getId());
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pst, con);
	}

	

	}

	


