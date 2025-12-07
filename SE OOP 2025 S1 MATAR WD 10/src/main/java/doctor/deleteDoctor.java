package doctor;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.doctorService;

/**
 * Servlet implementation class deleteDoctor
 */
@WebServlet("/deleteDoctor")
public class deleteDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteDoctor() {
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
            // Get the doctor ID from the request
            int doctorId = Integer.parseInt(request.getParameter("id"));

            // Delete the doctor
            doctorService service = new doctorService();
            boolean success = service.deleteDoctor(doctorId);

            // Set a message to display to the user
            if (success) {
                request.setAttribute("message", "Doctor deleted successfully");
            } else {
                request.setAttribute("message", "Failed to delete doctor");
            }

            // Forward the request to the managedoctor servlet to show updated
            // doctors list
            RequestDispatcher dispatcher = request.getRequestDispatcher("managedoctor");
            dispatcher.forward(request, response);

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
