package prj3_1;

import java.util.ArrayList;

public class S_flightService {

	S_flightDAO sdao = new S_flightDAO();
	
	/*
	public ArrayList<Flight> getreginfo(String fcode){
		ArrayList<Flight> list = sdao.selectcheck(fcode);
		return list;
		 
	} 
	*/
	public void deleteinfo(String resno) {
		sdao.deleteFlightinfo(resno);
	}
	 
	public Flight2 getreginfo(String resno){
		Flight2 f = sdao.selectonecheck(resno); 
		return f;
		 
	} 
}
