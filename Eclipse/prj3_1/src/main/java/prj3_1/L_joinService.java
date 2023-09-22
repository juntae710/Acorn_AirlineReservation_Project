package prj3_1;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class L_joinService {
	
	L_joinDAO dao = new L_joinDAO();
	
	
	public void register(L_Customer c) {
		try {
			dao.insert(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean check(String id) {
		return dao.selectOne(id);
		
	} 
    public L_Customer selectByid(String inputid) {
		
    	L_Customer c = dao.selectCustomer(inputid);
    	return c;
		
		
	}
	

}
