package servlet;

import model.Refund;
import services.RefundService;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RefundServlet")
public class RefundServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RefundService refundService = new RefundService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form parameters
        String referenceNo = request.getParameter("referenceNo");
        String mobileNo = request.getParameter("mobileNo");
        String refundRemarks = request.getParameter("refundRemarks");

        // Validate required field
        if (referenceNo == null || referenceNo.trim().isEmpty()) {
            request.setAttribute("message", "Error: Reference No is required!");
            request.getRequestDispatcher("refundform.jsp").forward(request, response);
            return;
        }
        
     // Validate Reference No (Required)
        if (referenceNo.isEmpty()) {
            request.setAttribute("message", "Error: Reference No is required.");
            request.getRequestDispatcher("refundform.jsp").forward(request, response);
            return;
        }

        // Validate Mobile No (Optional, but must be 10 digits if present)
        if (!mobileNo.isEmpty() && !mobileNo.matches("^\\d{10}$")) {
            request.setAttribute("message", "Error: Mobile number must be exactly 10 digits.");
            request.getRequestDispatcher("refundform.jsp").forward(request, response);
            return;
        }

        // Validate Remarks Length
        if (refundRemarks.length() > 300) {
            request.setAttribute("message", "Error: Refund remarks must not exceed 300 characters.");
            request.getRequestDispatcher("refundform.jsp").forward(request, response);
            return;
        }


        // Create and save refund with initial status "Pending"
        Refund refund = new Refund(referenceNo, mobileNo, refundRemarks, "Pending");
        try {
            refundService.saveRefund(refund);
            request.setAttribute("message", "Refund request submitted successfully!");
        } catch (SQLException e) {
            request.setAttribute("message", "Error submitting refund request: " + e.getMessage());
        } catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}

        request.getRequestDispatcher("refundform.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect to form if accessed via GET
        response.sendRedirect("refundform.jsp");
    }
}