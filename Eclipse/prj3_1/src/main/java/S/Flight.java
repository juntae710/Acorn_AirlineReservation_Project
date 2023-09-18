package prj0918프로젝트연습;

public class Flight {

	String fcod;
	String departure;
	String arrival;
	String Sday;
	String Eday;
	String Stime;
	String Etime;
	String airnum;
	
	public Flight() {
		// TODO Auto-generated constructor stub
	}

	public Flight(String fcod, String departure, String arrival, String sday, String eday, String stime, String etime,
			String airnum) {
		super();
		this.fcod = fcod;
		this.departure = departure;
		this.arrival = arrival;
		Sday = sday;
		Eday = eday;
		Stime = stime;
		Etime = etime;
		this.airnum = airnum;
	}

	public String getFcod() {
		return fcod;
	}

	public void setFcod(String fcod) {
		this.fcod = fcod;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public String getSday() {
		return Sday;
	}

	public void setSday(String sday) {
		Sday = sday;
	}

	public String getEday() {
		return Eday;
	}

	public void setEday(String eday) {
		Eday = eday;
	}

	public String getStime() {
		return Stime;
	}

	public void setStime(String stime) {
		Stime = stime;
	}

	public String getEtime() {
		return Etime;
	}

	public void setEtime(String etime) {
		Etime = etime;
	}

	public String getAirnum() {
		return airnum;
	}

	public void setAirnum(String airnum) {
		this.airnum = airnum;
	}

	@Override
	public String toString() {
		return "Flight [fcod=" + fcod + ", departure=" + departure + ", arrival=" + arrival + ", Sday=" + Sday
				+ ", Eday=" + Eday + ", Stime=" + Stime + ", Etime=" + Etime + ", airnum=" + airnum + "]";
	}
	
	
	
}
