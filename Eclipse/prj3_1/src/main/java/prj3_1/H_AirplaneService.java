package prj3_1;


public class H_AirplaneService {
	
	H_AirplaneDAO dao = new H_AirplaneDAO(); 
	
	public H_AirplaneService() {
		this.dao = new H_AirplaneDAO();
	}
	
	public boolean login(String inputId, String inputPw) {
		return dao.selectIP(inputId,  inputPw);
		
	}
	//테스트
	public static void main(String[] args) {
		H_AirplaneService a = new H_AirplaneService();
		boolean result = a.login("a", "b");
		System.out.println(result);
	}

}
