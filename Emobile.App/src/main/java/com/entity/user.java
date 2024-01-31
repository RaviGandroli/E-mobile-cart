package com.entity;

public class user {
	private int id;
	private String name;
	private String email;
	private String password;
	private String phoneno;
	private String address;
	private String lanmark;
	private String city;
	private String state;
	private String pincode;

	public user() {
		super();
	}

	public user(int id, String name, String email, String password, String phoneno, String address, String lanmark,
			String city, String state, String pincode) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phoneno = phoneno;
		this.address = address;
		this.lanmark = lanmark;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLanmark() {
		return lanmark;
	}

	public void setLanmark(String lanmark) {
		this.lanmark = lanmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

}
