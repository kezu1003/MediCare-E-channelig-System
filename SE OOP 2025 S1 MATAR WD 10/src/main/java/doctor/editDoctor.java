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
 * Servlet implementation class editDoctor
 */
@WebServlet("/editDoctor")
public class editDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public editDoctor() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the doctor ID from the request
            int doctorId = Integer.parseInt(request.getParameter("id"));

            // Get the doctor details
            doctorService service = new doctorService();
            doctor doc = service.getDoctorById(doctorId);

            // Set doctor as a request attribute
            request.setAttribute("doctor", doc);

            // Forward to the edit doctor page
            if (doc != null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("editdoctor.jsp");
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

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to managedoctor servlet
        response.sendRedirect("managedoctor");
    }
}
