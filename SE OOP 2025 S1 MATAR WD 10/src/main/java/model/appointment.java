package model;

import java.sql.Date;
import java.sql.Time;

public class appointment {
	
	int appointment_id;
	String patient_name;
	String doctor_name;
	String specialization;
	Date appointment_date;
	Time appointment_time;
	String status;
	String contact_number;
	String email_address;
	String reason;
	Date created_at;
	
	
	public Time getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	 
	
	
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	
	public String getPatient_name() {
		return patient_name;
	}
	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public Date getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(Date l) {
		this.appointment_date = l;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date string) {
		this.created_at = string;
	}
}
