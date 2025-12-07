package model;

import java.sql.Date;
import java.sql.Time;

public class bookappointment {

	int id;
	String d_name;
	String special;
	Date app_date;
	Time app_time;
	String p_name;
	String phone_number;
	String email;
	String p_reason;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public Date getApp_date() {
		return app_date;
	}

	public void setApp_date(Date app_date) {
		this.app_date = app_date;
	}

	public Time getApp_time() {
		return app_time;
	}

	public void setApp_time(Time app_time) {
		this.app_time = app_time;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getP_reason() {
		return p_reason;
	}

	public void setP_reason(String p_reason) {
		this.p_reason = p_reason;
	}

}
