package doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.doctor;
import services.doctorService;

@WebServlet("/adddoctor")
public class adddoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adddoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the add doctor form
        request.getRequestDispatcher("add_doctor.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doctor doc = new doctor();

        doc.setDoctor_id(Integer.parseInt(request.getParameter("doctorId")));
        doc.setDoctor_name(request.getParameter("doctorName"));
        doc.setDoctor_special(request.getParameter("specialization"));
        doc.setD_contact_number(request.getParameter("contactNumber"));
        doc.setD_email_address(request.getParameter("emailAddress"));
        doc.setAction(request.getParameter("availabilitySchedule")); // Using action field for availability_schedule

        doctorService service = new doctorService();
        service.addDoctor(doc);

        // Redirect to managedoctor servlet
        response.sendRedirect("managedoctor");
    }
}
