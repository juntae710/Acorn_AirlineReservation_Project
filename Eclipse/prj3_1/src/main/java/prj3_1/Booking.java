package prj3_1;

public class Booking {
	int bookno;
	String fcode;
	String id;
	String seatnum;
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}

	public Booking(int bookno, String fcode, String id, String seatnum) {
		super();
		this.bookno = bookno;
		this.fcode = fcode;
		this.id = id;
		this.seatnum = seatnum;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSeatnum() {
		return seatnum;
	}

	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	

}
