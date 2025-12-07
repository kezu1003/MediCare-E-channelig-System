package appoinment;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.appointmentService;

/**
 * Servlet implementation class deleteAppointment
 */
@WebServlet("/deleteAppointment")
public class deleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteAppointment() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the manageappointment servlet
        response.sendRedirect("manageappointment");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the appointment ID from the request
            int appointmentId = Integer.parseInt(request.getParameter("id"));

            // Delete the appointment
            appointmentService service = new appointmentService();
            boolean success = service.deleteAppointment(appointmentId);

            // Set a message to display to the user
            if (success) {
                request.setAttribute("message", "Appointment deleted successfully");
            } else {
                request.setAttribute("message", "Failed to delete appointment");
            }

            // Forward the request to the manageappointment servlet to show updated
            // appointments
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageappointment");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            // Handle invalid appointment ID
            request.setAttribute("message", "Invalid appointment ID");
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageappointment");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle other errors
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageappointment");
            dispatcher.forward(request, response);
        }
    }
}
