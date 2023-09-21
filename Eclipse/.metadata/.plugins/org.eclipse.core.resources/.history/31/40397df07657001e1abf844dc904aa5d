package join;

import java.sql.SQLException;

public class joinService {
	
	joinDAO dao = new joinDAO();
	
	
	public void register(Customer c) {
		try {
			dao.insert(c);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
