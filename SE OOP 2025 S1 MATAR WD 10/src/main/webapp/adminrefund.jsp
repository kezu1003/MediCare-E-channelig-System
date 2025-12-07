<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="services.RefundService" %>
<%@ page import="model.Refund" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            background-image: url('images/admin.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            min-height: 100vh;
        }
        .header {
            background: linear-gradient(to right, #1e90ff, #4169e1);
            color: white;
            padding: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header img {
            height: 40px;
        }
        .nav-buttons a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
            border: 1px solid white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .nav-buttons a:hover {
            background-color: #555;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #1541b0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color:#1541b0;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        select, button {
            padding: 5px;
            border-radius: 5px;
        }
        .action-btn {
            background-color: #d32f2f;
            color: white;
            border: none;
            cursor: pointer;
        }
        .action-btn:hover {
            background-color: #b71c1c;
        }
        .message {
            color: green;
            margin-bottom: 10px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="header">
       
        <div class="nav-buttons">
            <a href="AdminDashboard.jsp">Dashboard</a>
            
        </div>
    </div>

    <div class="container">
        <h2>Admin Dashboard - Refund Requests</h2>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="<%= message.startsWith("Error") ? "error" : "message" %>">
                <%= message %>
            </div>
        <% 
            }
        %>
        <table>
            <thead>
                <tr>
                    <th>Reference No</th>
                    <th>Mobile/CDMA No</th>
                    <th>Refund Remarks</th>
                    <th>Submission Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    RefundService refundService = new RefundService();
                    List<Refund> refunds = null;
                    try {
                        refunds = refundService.getAllRefunds();
                        if (refunds != null && !refunds.isEmpty()) {
                            for (Refund refund : refunds) {
                %>
                                <tr>
                                    <td><%= refund.getReferenceNo() %></td>
                                    <td><%= refund.getMobileNo() %></td>
                                    <td><%= refund.getRefundRemarks() %></td>
                                    <td><%= refund.getTimestamp() %></td>
                                    <td>
                                        <form action="AdminRefundServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="<%= refund.getId() %>">
                                            <select name="status" onchange="this.form.submit()">
                                                <option value="Pending" <%= "Pending".equals(refund.getStatus()) ? "selected" : "" %>>Pending</option>
                                                <option value="Approved" <%= "Approved".equals(refund.getStatus()) ? "selected" : "" %>>Approved</option>
                                                <option value="Rejected" <%= "Rejected".equals(refund.getStatus()) ? "selected" : "" %>>Rejected</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="AdminRefundServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<%= refund.getId() %>">
                                            <button type="submit" class="action-btn" onclick="return confirm('Are you sure you want to delete this record?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                <% 
                            }
                        } else {
                %>
                            <tr>
                                <td colspan="6">No refund requests found.</td>
                            </tr>
                <% 
                        }
                    } catch (SQLException e) {
                %>
                            <tr>
                                <td colspan="6">Error loading refund requests: <%= e.getMessage() %></td>
                            </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>