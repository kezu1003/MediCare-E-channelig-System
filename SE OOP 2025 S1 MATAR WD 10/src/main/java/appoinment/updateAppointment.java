package appoinment;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.appointment;
import services.appointmentService;

/**
 * Servlet implementation class updateAppointment
 */
@WebServlet("/updateAppointment")
public class updateAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAppointment() {
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
            // Get the appointment ID from the form
            int appointmentId = Integer.parseInt(request.getParameter("id"));

            // First, get the existing appointment to preserve created_at date
            appointmentService service = new appointmentService();
            appointment existingApp = service.getAppointmentById(appointmentId);

            if (existingApp != null) {
                // Create a new appointment object with updated values
                appointment updatedApp = new appointment();
                updatedApp.setAppointment_id(appointmentId);
                updatedApp.setPatient_name(request.getParameter("patientName"));
                updatedApp.setDoctor_name(request.getParameter("doctorName"));
                updatedApp.setSpecialization(request.getParameter("specialization"));

                // Parse date and time
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date parsedDate = dateFormat.parse(request.getParameter("appointmentDate"));
                    updatedApp.setAppointment_date(new Date(parsedDate.getTime()));

                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                    java.util.Date parsedTime = timeFormat.parse(request.getParameter("appointmentTime"));
                    updatedApp.setAppointment_time(new Time(parsedTime.getTime()));
                } catch (Exception e) {
                    throw new ServletException("Error parsing date or time", e);
                }

                updatedApp.setStatus(request.getParameter("status"));
                updatedApp.setContact_number(request.getParameter("contactNumber"));
                updatedApp.setEmail_address(request.getParameter("emailAddress"));
                updatedApp.setReason(request.getParameter("reason"));

                // Keep the original created_at date
                updatedApp.setCreated_at(existingApp.getCreated_at());

                // Update the appointment
                boolean success = service.updateAppointment(updatedApp);

                // Set a message to display to the user
                if (success) {
                    request.setAttribute("message", "Appointment updated successfully");
                } else {
                    request.setAttribute("message", "Failed to update appointment");
                }

                // Forward to the manageappointment servlet
                RequestDispatcher dispatcher = request.getRequestDispatcher("manageappointment");
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
}
