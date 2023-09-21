package prj3_1;

public class Airport {
	String city;
	String code;
	String country;
	String cotinet;
	
	public Airport() {
		// TODO Auto-generated constructor stub
	}

	public Airport(String city, String code, String country, String cotinet) {
		super();
		this.city = city;
		this.code = code;
		this.country = country;
		this.cotinet = cotinet;
	}

	public Airport(String city, String code, String country) {
		super();
		this.city = city;
		this.code = code;
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCotinet() {
		return cotinet;
	}

	public void setCotinet(String cotinet) {
		this.cotinet = cotinet;
	}

	@Override
	public String toString() {
		return "Country [city=" + city + ", code=" + code + ", country=" + country + ", cotinet=" + cotinet+  "]";
	}
	

}
