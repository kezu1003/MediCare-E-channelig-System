package appoinment;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.appointment;
import services.appointmentService;

/**
 * Servlet implementation class editAppointment
 */
@WebServlet("/editAppointment")
public class editAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public editAppointment() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the appointment ID from the request
            int appointmentId = Integer.parseInt(request.getParameter("id"));

            // Get the appointment details
            appointmentService service = new appointmentService();
            appointment app = service.getAppointmentById(appointmentId); // Set appointment as a request attribute
            request.setAttribute("appointment", app);

            // Forward to the edit appointment page
            if (app != null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("editappoinment.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("message", "Appointment not found");
                RequestDispatcher dispatcher = request.getRequestDispatcher("manageappointment");
                dispatcher.forward(request, response);
            }

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

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to manageappointment servlet
        response.sendRedirect("manageappointment");
    }
}
