package services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import utils.DBconnect;
import model.bookappointment;

public class bookappointmentService { // CREATE - Book a new appointment
    public void addBookAppointment(bookappointment booking) {
        try {
            String query = "INSERT INTO book_appointments (d_name, special, app_date, app_time, p_name, phone_number, email, p_reason) VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setString(1, booking.getD_name());
            pst.setString(2, booking.getSpecial());
            pst.setDate(3, booking.getApp_date());
            pst.setTime(4, booking.getApp_time());
            pst.setString(5, booking.getP_name());
            pst.setString(6, booking.getPhone_number());
            pst.setString(7, booking.getEmail());
            pst.setString(8, booking.getP_reason());

            pst.executeUpdate();

            System.out.println("Appointment booked successfully!");

        } catch (Exception e) {
            System.err.println("Error booking appointment: " + e.getMessage());
            e.printStackTrace();
        }
    } // READ - View all booked appointments

    public ArrayList<bookappointment> getAllBookedAppointments() {
        ArrayList<bookappointment> bookingList = new ArrayList<bookappointment>();

        try {
            String query = "SELECT * FROM book_appointments";

            Statement statement = DBconnect.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                bookappointment booking = new bookappointment();
                booking.setId(rs.getInt("id"));
                booking.setD_name(rs.getString("d_name"));
                booking.setSpecial(rs.getString("special"));
                booking.setApp_date(rs.getDate("app_date"));
                booking.setApp_time(rs.getTime("app_time"));
                booking.setP_name(rs.getString("p_name"));
                booking.setPhone_number(rs.getString("phone_number"));
                booking.setEmail(rs.getString("email"));
                booking.setP_reason(rs.getString("p_reason"));

                bookingList.add(booking);
            }

            return bookingList;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    } // READ - Get appointment by ID

    public bookappointment getBookedAppointmentById(int id) {
        try {
            String query = "SELECT * FROM book_appointments WHERE id=?";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                bookappointment booking = new bookappointment();
                booking.setId(rs.getInt("id"));
                booking.setD_name(rs.getString("d_name"));
                booking.setSpecial(rs.getString("special"));
                booking.setApp_date(rs.getDate("app_date"));
                booking.setApp_time(rs.getTime("app_time"));
                booking.setP_name(rs.getString("p_name"));
                booking.setPhone_number(rs.getString("phone_number"));
                booking.setEmail(rs.getString("email"));
                booking.setP_reason(rs.getString("p_reason"));

                return booking;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    } // UPDATE - Update booked appointment

    public boolean updateBookedAppointment(bookappointment booking, int id) {
        try {
            String query = "UPDATE book_appointments SET d_name=?, special=?, app_date=?, app_time=?, p_name=?, phone_number=?, email=?, p_reason=? WHERE id=?";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setString(1, booking.getD_name());
            pst.setString(2, booking.getSpecial());
            pst.setDate(3, booking.getApp_date());
            pst.setTime(4, booking.getApp_time());
            pst.setString(5, booking.getP_name());
            pst.setString(6, booking.getPhone_number());
            pst.setString(7, booking.getEmail());
            pst.setString(8, booking.getP_reason());
            pst.setInt(9, id);

            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    } // DELETE - Cancel booked appointment

    public boolean cancelBookedAppointment(int id) {
        try {
            String query = "DELETE FROM book_appointments WHERE id=?";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setInt(1, id);

            int rowsDeleted = pst.executeUpdate();
            return rowsDeleted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}