package prj3_1;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

public class p_Service {

	P_DAO dao = new P_DAO();

	public P_Customer selectidpw(String id) {
		// 하나만찾기, 조회하기
		P_Customer c = dao.selectidpw(id);
		return c;
	}

	public void updateMember(P_Customer c) {
		// 수정하기 업데이트하기
		dao.updateMember(c);
	}

	public JSONObject selectidpw2(String id) {
		// 하나만찾기, 조회하기
		P_Customer c = dao.selectidpw(id);
		JSONObject o = new JSONObject();
		o.put("id", c.getId());
		o.put("pw", c.getPw());
		o.put("name", c.getName());
		o.put("phone", c.getPhone());
		o.put("gender", c.getGender());
		return o;
	}

	

	
	public static void main(String[] args) {
		p_Service s = new p_Service();
//	
	}

}
