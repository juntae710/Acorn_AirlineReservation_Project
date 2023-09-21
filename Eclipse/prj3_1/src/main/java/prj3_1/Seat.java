package prj3_1;

public class Seat {
	String seatnum;
	String seatgrade;
	String fcode;
	int seatline;
	String airnum;
	int seatstate;
	public Seat() {
		// TODO Auto-generated constructor stub
	}
	public Seat(String seatnum, String seatgrade, String fcode, int seatline, String airnum, int seatstate) {
		super();
		this.seatnum = seatnum;
		this.seatgrade = seatgrade;
		this.fcode = fcode;
		this.seatline = seatline;
		this.airnum = airnum;
		this.seatstate = seatstate;
	}
	public int getSeatstate() {
		return seatstate;
	}
	public void setSeatstate(int seatstate) {
		this.seatstate = seatstate;
	}
	public String getSeatnum() {
		return seatnum;
	}
	public String getSeatgrade() {
		return seatgrade;
	}
	public String getFcode() {
		return fcode;
	}
	public int getSeatline() {
		return seatline;
	}
	public String getAirnum() {
		return airnum;
	}
	@Override
	public String toString() {
		return "Seat [seatnum=" + seatnum + ", seatgrade=" + seatgrade + ", fcode=" + fcode + ", seatline=" + seatline
				+ ", airnum=" + airnum + ", seatstate=" + seatstate + "]";
	}
	

}
