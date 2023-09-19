package ptj3_1team;

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

	public JSONArray selectRes(String id) {

		ArrayList<P_ResUD> list = dao.selectRes(id);

		JSONArray arr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			P_ResUD r = list.get(i);
			JSONObject o = new JSONObject();
			o.put("resno", r.getResno());
			o.put("fcode", r.getFcode());
			o.put("departure", r.getDeparture());
			o.put("arrival", r.getArrival());
			o.put("sday", r.getSday());
			o.put("eday", r.getEday());
			o.put("stime", r.getStime());
			o.put("etime", r.getEtime());
			o.put("airnum", r.getAirnum());
			o.put("airname", r.getAirname());

			arr.put(o);
		}
		return arr;
	}

	public ArrayList<P_ResUD> selectRes2(String id) {

		ArrayList<P_ResUD> list = dao.selectRes(id);

		return list;
	}

	public void updateRes(P_ResUD r) {
		// 수정하기 업데이트하기
		dao.updateRes(r);
	}

	public static void main(String[] args) {
		p_Service s = new p_Service();
//		P_Customer c = s.selectidpw("test01");
//		System.out.println("c=" + c.getId());
		JSONArray arr = s.selectRes("test01");
		System.out.println(arr);
	}

}
