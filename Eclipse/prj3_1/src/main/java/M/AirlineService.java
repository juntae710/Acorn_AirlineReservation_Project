package prj_airline;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

// 제이슨 만들어서 모두 합쳐야 할 듯
public class AirlineService {
	AirlineDAO dao = new AirlineDAO();
	
	public JSONArray getAirportJSON(String airportText) {
		if (airportText == null) airportText = "";
	    //StringBuffer result = new StringBuffer("");
	    //result.append("{\"result\":[");
	    ArrayList<Airport> airportList = dao.searchAirport(airportText);
	    JSONArray arr = new JSONArray();
	    for (int i = 0; i < airportList.size(); i++) {
	    	Airport a = airportList.get(i);
			JSONObject o = new JSONObject();
			o.put("city", a.getCity());
			o.put("code",a.getCode());
			o.put("country",a.getCountry());
			o.put("cotinet", a.getCotinet());
			
			arr.put(o);
	        
	    }
	    return arr;
	    
	}
	public JSONArray allAirportJSON() {
		ArrayList<Airport> allAirport = dao.airportList();
		JSONArray arr = new JSONArray();
		for(int i=0; i<allAirport.size(); i++) {
			Airport a = allAirport.get(i);
			JSONObject o = new JSONObject();
			o.put("city", a.getCity());
			o.put("code",a.getCode());
			o.put("country",a.getCountry());
			o.put("cotinet", a.getCotinet());
			
			arr.put(o);
		}
		return arr;
	}
	public static void main(String args[]) {
		AirlineService as = new AirlineService();
		JSONArray js = as.getAirportJSON("인");
		System.out.println(js.toString());
		
	}
	

}
