package prj3_1;


public class L_Customer {
	

	String id;
	String pw;
	String name;
	String phone;
	int resno;
	String pasno;
	String gender;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getResno() {
		return resno;
	}
	public void setResno(int resno) {
		this.resno = resno;
	}
	public String getPasno() {
		return pasno;
	}
	public void setPasno(String pasno) {
		this.pasno = pasno;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	public L_Customer(String id, String pw, String name, String phone, int resno, String pasno, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.resno = resno;
		this.pasno = pasno;
		this.gender = gender;
	}
	public L_Customer(String id, String pw, String name, String phone, String pasno, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.pasno = pasno;
		this.gender = gender;
	}
	
	public L_Customer(String id) {
		super();
		this.id = id;
	}
	
	
	public L_Customer(String id, String pw, String name, String phone, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
	}
	
	
	@Override
	public String toString() {
		return "Customer [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", resno=" + resno
				+ ", pasno=" + pasno + ", gender=" + gender + "]";
	}

}
