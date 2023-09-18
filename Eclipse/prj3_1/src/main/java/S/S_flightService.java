package prj0918프로젝트연습;

import java.util.ArrayList;

public class S_flightService {

	S_flightDAO sdao = new S_flightDAO();
	
	public ArrayList<Flight> getreginfo(String fcode){
		ArrayList<Flight> list = sdao.selectcheck(fcode);
		return list;
		 
	} 
	
	public void deleteinfo(String fcode) {
		sdao.deleteFlightinfo(fcode);
	}
	 
}
