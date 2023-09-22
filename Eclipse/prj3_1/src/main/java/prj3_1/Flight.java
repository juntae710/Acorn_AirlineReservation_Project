package prj3_1;

import java.util.Date;

public class Flight {
	String fcode;
	String dep;
	String arr;
	Date sday;
	Date eday;
	String stime;
	String etime;
	String airnum;
	public Flight() {
		// TODO Auto-generated constructor stub
	}
	
	public Flight(String fcode, String dep, String arr, Date sday, Date eday, String stime, String etime,
			String airnum) {
		super();
		this.fcode = fcode;
		this.dep = dep;
		this.arr = arr;
		this.sday = sday;
		this.eday = eday;
		this.stime = stime;
		this.etime = etime;
		this.airnum = airnum;
	}

	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public Date getSday() {
		return sday;
	}
	public void setSday(Date sday) {
		this.sday = sday;
	}
	public Date getEday() {
		return eday;
	}
	public void setEday(Date eday) {
		this.eday = eday;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getAirnum() {
		return airnum;
	}
	public void setAirnum(String airnum) {
		this.airnum = airnum;
	}

	@Override
	public String toString() {
		return "Flight [fcode=" + fcode + ", dep=" + dep + ", arr=" + arr + ", sday=" + sday + ", eday=" + eday
				+ ", stime=" + stime + ", etime=" + etime + ", airnum=" + airnum + "]";
	}
	
	

}
