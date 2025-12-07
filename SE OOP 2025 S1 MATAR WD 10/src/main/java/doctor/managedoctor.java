package doctor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.doctor;
import services.doctorService;

@WebServlet("/managedoctor")
public class managedoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public managedoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get all doctors
        doctorService service = new doctorService();

        ArrayList<doctor> doctors = service.getAllDoctors();

        // Set doctors attribute
        request.setAttribute("doctors", doctors);

        // Keep any message that was set by another servlet
        String message = (String) request.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("manage_doctors.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doctorService service = new doctorService();

        ArrayList<doctor> doctors = service.getAllDoctors();

        // Set doctors attribute
        request.setAttribute("doctors", doctors);

        // Keep any message that was set by another servlet
        String message = (String) request.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("manage_doctors.jsp");
        dispatcher.forward(request, response);
    }
}
