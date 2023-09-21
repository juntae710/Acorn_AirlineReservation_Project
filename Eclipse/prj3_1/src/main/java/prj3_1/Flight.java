package prj3_1;
import java.sql.Date;
import java.time.LocalDate;
public class Flight {
	String fcode;
	String departure;
	String arrival;
	Date sday;
	Date eday;
	String stime;
	String etime;
	String airnum;
	
	public Flight() {
		// TODO Auto-generated constructor stub
	}

	public Flight(String fcode, String departure, String arrival, Date sday, Date eday, String stime, String etime,
			String airnum) {
		super();
		this.fcode = fcode;
		this.departure = departure;
		this.arrival = arrival;
		this.sday = sday;
		this.eday = eday;
		this.stime = stime;
		this.etime = etime;
		this.airnum = airnum;
	}

	public String getFcode() {
		return fcode;
	}

	public String getDeparture() {
		return departure;
	}

	public String getArrival() {
		return arrival;
	}

	public Date getSday() {
		return sday;
	}

	public Date getEday() {
		return eday;
	}

	public String getStime() {
		return stime;
	}

	public String getEtime() {
		return etime;
	}

	public String getAirnum() {
		return airnum;
	}

	@Override
	public String toString() {
		return "Flight [fcode=" + fcode + ", departure=" + departure + ", arrival=" + arrival + ", sday=" + sday
				+ ", eday=" + eday + ", stime=" + stime + ", etime=" + etime + ", airnum=" + airnum + "]";
	}
	
	

}
