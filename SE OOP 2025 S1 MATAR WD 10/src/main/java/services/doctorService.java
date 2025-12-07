package services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import utils.DBconnect;
import model.doctor;

public class doctorService {

    // CREATE - Add a new doctor
    public void addDoctor(doctor doc) {
        try {
            String query = "INSERT INTO doctors (id, name, specialization, contact_number, email_address, availability_schedule) VALUES(?,?,?,?,?,?)";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setInt(1, doc.getDoctor_id());
            pst.setString(2, doc.getDoctor_name());
            pst.setString(3, doc.getDoctor_special());
            pst.setString(4, doc.getD_contact_number());
            pst.setString(5, doc.getD_email_address());
            pst.setString(6, doc.getAction()); // Using action field for availability_schedule

            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // READ - Get all doctors
    public ArrayList<doctor> getAllDoctors() {
        try {
            ArrayList<doctor> doctorList = new ArrayList<doctor>();

            String query = "SELECT * FROM doctors";

            Statement statement = DBconnect.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                doctor doc = new doctor();
                doc.setDoctor_id(rs.getInt("id"));
                doc.setDoctor_name(rs.getString("name"));
                doc.setDoctor_special(rs.getString("specialization"));
                doc.setD_contact_number(rs.getString("contact_number"));
                doc.setD_email_address(rs.getString("email_address"));
                doc.setAction(rs.getString("availability_schedule"));

                doctorList.add(doc);
            }

            return doctorList;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // READ - Get a specific doctor by ID
    public doctor getDoctorById(int id) {
        try {
            String query = "SELECT * FROM doctors WHERE id=?";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                doctor doc = new doctor();
                doc.setDoctor_id(rs.getInt("id"));
                doc.setDoctor_name(rs.getString("name"));
                doc.setDoctor_special(rs.getString("specialization"));
                doc.setD_contact_number(rs.getString("contact_number"));
                doc.setD_email_address(rs.getString("email_address"));
                doc.setAction(rs.getString("availability_schedule"));

                return doc;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // UPDATE - Update doctor information
    public boolean updateDoctor(doctor doc) {
        try {
            String query = "UPDATE doctors SET name=?, specialization=?, contact_number=?, email_address=?, availability_schedule=? WHERE id=?";

            PreparedStatement pst = DBconnect.getConnection().prepareStatement(query);
            pst.setString(1, doc.getDoctor_name());
            pst.setString(2, doc.getDoctor_special());
            pst.setString(3, doc.getD_contact_number());
            pst.setString(4, doc.getD_email_address());
            pst.setString(5, doc.getAction()); // Using action field for availability_schedule
            pst.setInt(6, doc.getDoctor_id());

            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE - Delete a doctor
    public boolean deleteDoctor(int id) {
        try {
            String query = "DELETE FROM doctors WHERE id=?";

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