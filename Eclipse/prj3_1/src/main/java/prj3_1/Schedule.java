package prj3_1;

import java.util.Date;

public class Schedule {
	String fcode;
	String dep;
	String arrival;
	Date sday;
	Date eday;
	String stime;
	String etime;
	String airnum;
	String ariname;
	int econum;
	int bsnnum;
	public Schedule() {
		// TODO Auto-generated constructor stub
	}
	public Schedule(String fcode, String dep, String arrival, Date sday, Date eday, String stime, String etime,
			String airnum, String ariname, int econum, int bsnnum) {
		super();
		this.fcode = fcode;
		this.dep = dep;
		this.arrival = arrival;
		this.sday = sday;
		this.eday = eday;
		this.stime = stime;
		this.etime = etime;
		this.airnum = airnum;
		this.ariname = ariname;
		this.econum = econum;
		this.bsnnum = bsnnum;
	}
	public String getFcode() {
		return fcode;
	}
	public String getDep() {
		return dep;
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
	public String getAriname() {
		return ariname;
	}
	public int getEconum() {
		return econum;
	}
	public int getBsnnum() {
		return bsnnum;
	}
	@Override
	public String toString() {
		return "Schedule [fcode=" + fcode + ", dep=" + dep + ", arrival=" + arrival + ", sday=" + sday + ", eday="
				+ eday + ", stime=" + stime + ", etime=" + etime + ", airnum=" + airnum + ", ariname=" + ariname
				+ ", econum=" + econum + ", bsnnum=" + bsnnum + "]";
	}
	
	

}
