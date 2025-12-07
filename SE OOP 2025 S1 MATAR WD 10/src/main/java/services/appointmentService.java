package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import utils.DBconnect;
import model.appointment;

public class appointmentService {
	public void addAppointment(appointment app) {
		try {

			// Fix syntax error: changed '.' to ',' between reason and created_at
			String query = "insert into appointments values('" + app.getAppointment_id() + "','" + app.getPatient_name()
					+ "','" + app.getDoctor_name() + "','" + app.getSpecialization() + "','" + app.getAppointment_date()
					+ "','" + app.getAppointment_time() + "','" + app.getStatus() + "','" + app.getContact_number()
					+ "','" + app.getEmail_address() + "','" + app.getReason() + "','" + app.getCreated_at() + "')";

			Statement statement = DBconnect.getConnection().createStatement();
			System.out.println(query);
			statement.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<appointment> getAllAppointment() {
		ArrayList<appointment> listapp = new ArrayList<appointment>();
		System.out.println("getAllAppointment method called");

		try {
			String query = "SELECT * FROM appointments";
			System.out.println("Query: " + query);

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				appointment app = new appointment();
				app.setAppointment_id(rs.getInt("appointment_id"));
				app.setPatient_name(rs.getString("patient_name"));
				app.setDoctor_name(rs.getString("doctor_name"));
				app.setSpecialization(rs.getString("specialization"));
				app.setAppointment_date(rs.getDate("appointment_date"));
				app.setAppointment_time(rs.getTime("appointment_time"));
				app.setStatus(rs.getString("status"));
				app.setContact_number(rs.getString("contact_number")); // Changed getNString to getString
				app.setEmail_address(rs.getString("email_address"));
				app.setReason(rs.getString("reason"));
				app.setCreated_at(rs.getDate("created_at"));

				listapp.add(app);
			}
		} catch (Exception e) {
			System.err.println("Error retrieving appointments: " + e.getMessage());
			e.printStackTrace();
		}
		return listapp; // Return empty list if exception occurs instead of null
	}

	public boolean updateAppointmentStatus(int appointmentId, String status) {
		boolean success = false;
		try {
			String query = "UPDATE appointments SET status='" + status + "' WHERE appointment_id=" + appointmentId;

			Statement statement = DBconnect.getConnection().createStatement();
			System.out.println("Executing query: " + query);
			int rowsAffected = statement.executeUpdate(query);

			if (rowsAffected > 0) {
				success = true;
			}
		} catch (Exception e) {
			System.err.println("Error updating appointment status: " + e.getMessage());
			e.printStackTrace();
		}
		return success;
	}

	public boolean deleteAppointment(int appointmentId) {
		boolean success = false;
		try {
			String query = "DELETE FROM appointments WHERE appointment_id=" + appointmentId;

			Statement statement = DBconnect.getConnection().createStatement();
			System.out.println("Executing query: " + query);
			int rowsAffected = statement.executeUpdate(query);

			if (rowsAffected > 0) {
				success = true;
			}
		} catch (Exception e) {
			System.err.println("Error deleting appointment: " + e.getMessage());
			e.printStackTrace();
		}
		return success;
	}

	public appointment getAppointmentById(int appointmentId) {
		appointment app = null;
		try {
			String query = "SELECT * FROM appointments WHERE appointment_id=" + appointmentId;

			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);

			if (rs.next()) {
				app = new appointment();
				app.setAppointment_id(rs.getInt("appointment_id"));
				app.setPatient_name(rs.getString("patient_name"));
				app.setDoctor_name(rs.getString("doctor_name"));
				app.setSpecialization(rs.getString("specialization"));
				app.setAppointment_date(rs.getDate("appointment_date"));
				app.setAppointment_time(rs.getTime("appointment_time"));
				app.setStatus(rs.getString("status"));
				app.setContact_number(rs.getString("contact_number"));
				app.setEmail_address(rs.getString("email_address"));
				app.setReason(rs.getString("reason"));
				app.setCreated_at(rs.getDate("created_at"));
			}
		} catch (Exception e) {
			System.err.println("Error retrieving appointment by ID: " + e.getMessage());
			e.printStackTrace();
		}
		return app;
	}

	public boolean updateAppointment(appointment app) {
		boolean success = false;
		try {
			String query = "UPDATE appointments SET " +
					"patient_name='" + app.getPatient_name() + "', " +
					"doctor_name='" + app.getDoctor_name() + "', " +
					"specialization='" + app.getSpecialization() + "', " +
					"appointment_date='" + app.getAppointment_date() + "', " +
					"appointment_time='" + app.getAppointment_time() + "', " +
					"status='" + app.getStatus() + "', " +
					"contact_number='" + app.getContact_number() + "', " +
					"email_address='" + app.getEmail_address() + "', " +
					"reason='" + app.getReason() + "' " +
					"WHERE appointment_id=" + app.getAppointment_id();

			Statement statement = DBconnect.getConnection().createStatement();
			System.out.println("Executing query: " + query);
			int rowsAffected = statement.executeUpdate(query);

			if (rowsAffected > 0) {
				success = true;
			}
		} catch (Exception e) {
			System.err.println("Error updating appointment: " + e.getMessage());
			e.printStackTrace();
		}
		return success;
	}
}
