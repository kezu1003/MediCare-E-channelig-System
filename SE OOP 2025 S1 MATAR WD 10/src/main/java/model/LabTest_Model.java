package model;

import java.sql.Timestamp;

public class LabTest_Model {
     String hospitalName;
     String address;
     String contactNo;
     String email;
		
     String testName;
     Timestamp date; 
     int testPrice;
		 
     
     
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getTestPrice() {
		return testPrice;
	}
	public void setTestPrice(int testPrice) {
		this.testPrice = testPrice;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
    
}