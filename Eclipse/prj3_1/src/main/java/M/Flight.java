package prj_airline;
import java.sql.Date;
import java.time.LocalDate;
public class Flight {
	String fcode;
	String departure;
	Date sday;
	Date eday;
	String stime;
	String etime;
	String arinum;
	
	public Flight() {
		// TODO Auto-generated constructor stub
	}

	public Flight(String fcode, String departure, Date sday, Date eday, String stime, String etime, String arinum) {
		super();
		this.fcode = fcode;
		this.departure = departure;
		this.sday = sday;
		this.eday = eday;
		this.stime = stime;
		this.etime = etime;
		this.arinum = arinum;
	}

	public String getFcode() {
		return fcode;
	}

	public String getDeparture() {
		return departure;
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

	public String getArinum() {
		return arinum;
	}
	

}
