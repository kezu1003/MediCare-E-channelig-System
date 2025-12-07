package doctor;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.doctor;
import services.doctorService;

/**
 * Servlet implementation class updateDoctor
 */
@WebServlet("/updateDoctor")
public class updateDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDoctor() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the managedoctor servlet
        response.sendRedirect("managedoctor");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the doctor ID from the form
            int doctorId = Integer.parseInt(request.getParameter("id"));

            doctorService service = new doctorService();
            doctor existingDoc = service.getDoctorById(doctorId);

            if (existingDoc != null) {
                // Create a doctor object with updated values
                doctor updatedDoc = new doctor();
                updatedDoc.setDoctor_id(doctorId);
                updatedDoc.setDoctor_name(request.getParameter("doctorName"));
                updatedDoc.setDoctor_special(request.getParameter("specialization"));
                updatedDoc.setD_contact_number(request.getParameter("contactNumber"));
                updatedDoc.setD_email_address(request.getParameter("emailAddress"));
                updatedDoc.setAction(request.getParameter("availabilitySchedule"));

                // Update the doctor
                boolean success = service.updateDoctor(updatedDoc);

                // Set a message to display to the user
                if (success) {
                    request.setAttribute("message", "Doctor information updated successfully");
                } else {
                    request.setAttribute("message", "Failed to update doctor information");
                }

                // Forward to the managedoctor servlet
                RequestDispatcher dispatcher = request.getRequestDispatcher("managedoctor");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("message", "Doctor not found");
                RequestDispatcher dispatcher = request.getRequestDispatcher("managedoctor");
                dispatcher.forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle invalid doctor ID
            request.setAttribute("message", "Invalid doctor ID");
            RequestDispatcher dispatcher = request.getRequestDispatcher("managedoctor");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle other errors
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("managedoctor");
            dispatcher.forward(request, response);
        }
    }
}
