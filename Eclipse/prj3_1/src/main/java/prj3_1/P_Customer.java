package prj3_1;

public class P_Customer {
private String id;
private String pw;
private String name;
private String phone;
private String gender;

public P_Customer() {
	// TODO Auto-generated constructor stub
}



public P_Customer(String id, String pw, String name, String phone, String gender) {
	super();
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.phone = phone;
	this.gender = gender;
}



@Override
public String toString() {
	return "P_Customer [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", gender=" + gender + "]";
}



public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

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

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

}
