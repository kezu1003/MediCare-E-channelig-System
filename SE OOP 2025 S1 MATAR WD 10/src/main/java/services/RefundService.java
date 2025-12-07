package services;

import model.Refund;
import utils.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RefundService {
    public void saveRefund(Refund refund) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO refund_requests (reference_no, mobile_no, refund_remarks, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, refund.getReferenceNo());
            stmt.setString(2, refund.getMobileNo());
            stmt.setString(3, refund.getRefundRemarks());
            stmt.setString(4, refund.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Refund> getAllRefunds() throws SQLException, ClassNotFoundException {
        List<Refund> refunds = new ArrayList<>();
        String sql = "SELECT * FROM refund_requests ORDER BY timestamp DESC";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Refund refund = new Refund();
                refund.setId(rs.getInt("id"));
                refund.setReferenceNo(rs.getString("reference_no"));
                refund.setMobileNo(rs.getString("mobile_no"));
                refund.setRefundRemarks(rs.getString("refund_remarks"));
                refund.setTimestamp(rs.getString("timestamp"));
                refund.setStatus(rs.getString("status"));
                refunds.add(refund);
            }
        }
        return refunds;
    }

    public void updateStatus(int id, String status) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE refund_requests SET status = ? WHERE id = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        }
    }

    public void deleteRefund(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM refund_requests WHERE id = ?";
        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}