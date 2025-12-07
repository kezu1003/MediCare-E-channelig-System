package servlet;

import services.RefundService;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminRefundServlet")
public class AdminRefundServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RefundService refundService = new RefundService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            if ("update".equals(action)) {
                String status = request.getParameter("status");
                refundService.updateStatus(id, status);
                request.setAttribute("message", "Status updated successfully!");
            } else if ("delete".equals(action)) {
                refundService.deleteRefund(id);
                request.setAttribute("message", "Refund request deleted successfully!");
            }
        } catch (SQLException e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}

        request.getRequestDispatcher("/adminrefund.jsp").forward(request, response);
    }
}