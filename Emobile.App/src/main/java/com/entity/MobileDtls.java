package com.entity;

public class MobileDtls {

	private int mobileid;
	private String mobilename;
	private String campany;
	private String price;
	private String mobilecategory;
	private String status;
	private String photo;
	private String email;
	
	
	
	
	public MobileDtls() {
		super();
	}




	public MobileDtls(String mobilename, String campany, String price, String mobilecategory, String status,
			String photo, String email) {
		super();
		this.mobileid = mobileid;
		this.mobilename = mobilename;
		this.campany = campany;
		this.price = price;
		this.mobilecategory = mobilecategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}




	public int getMobileid() {
		return mobileid;
	}




	public void setMobileid(int mobileid) {
		this.mobileid = mobileid;
	}




	public String getMobilename() {
		return mobilename;
	}




	public void setMobilename(String mobilename) {
		this.mobilename = mobilename;
	}




	public String getCampany() {
		return campany;
	}




	public void setCampany(String campany) {
		this.campany = campany;
	}




	public String getPrice() {
		return price;
	}




	public void setPrice(String price) {
		this.price = price;
	}




	public String getMobilecategory() {
		return mobilecategory;
	}




	public void setMobilecategory(String mobilecategory) {
		this.mobilecategory = mobilecategory;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public String getPhoto() {
		return photo;
	}




	public void setPhoto(String photo) {
		this.photo = photo;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}
	
	public String toString() {
		return mobilename+campany+price+mobilecategory+status+photo+email;
	}
	
	
}
