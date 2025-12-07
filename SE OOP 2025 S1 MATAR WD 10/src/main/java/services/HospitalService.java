package services;

import model.Hospital;
import utils.DBconnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalService {

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        return DBconnect.getConnection(); 
    }

    public void addHospital(Hospital hospital) throws ClassNotFoundException {
        String sql = "INSERT INTO hospitals (name, address, phone) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, hospital.getName());
            stmt.setString(2, hospital.getAddress());
            stmt.setString(3, hospital.getPhone());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Hospital> getAllHospitals() throws ClassNotFoundException {
        List<Hospital> hospitals = new ArrayList<>();
        String sql = "SELECT * FROM hospitals";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Hospital hospital = new Hospital();
                hospital.setId(rs.getInt("id"));
                hospital.setName(rs.getString("name"));
                hospital.setAddress(rs.getString("address"));
                hospital.setPhone(rs.getString("phone"));
                hospitals.add(hospital);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hospitals;
    }

    public Hospital getHospitalById(int id) throws ClassNotFoundException {
        Hospital hospital = null;
        String sql = "SELECT * FROM hospitals WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                hospital = new Hospital();
                hospital.setId(rs.getInt("id"));
                hospital.setName(rs.getString("name"));
                hospital.setAddress(rs.getString("address"));
                hospital.setPhone(rs.getString("phone"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hospital;
    }

    public void updateHospital(Hospital hospital) throws ClassNotFoundException {
        String sql = "UPDATE hospitals SET name = ?, address = ?, phone = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, hospital.getName());
            stmt.setString(2, hospital.getAddress());
            stmt.setString(3, hospital.getPhone());
            stmt.setInt(4, hospital.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteHospital(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM hospitals WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}