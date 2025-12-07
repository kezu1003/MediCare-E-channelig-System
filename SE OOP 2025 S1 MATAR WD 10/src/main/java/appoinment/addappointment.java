package appoinment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.appointment;
import services.appointmentService;

@WebServlet("/addappointment")
public class addappointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addappointment() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		appointment app = new appointment();

		app.setAppointment_id(Integer.parseInt(request.getParameter("appointmentId")));
		app.setPatient_name(request.getParameter("patientName"));
		app.setDoctor_name(request.getParameter("doctorName"));
		app.setSpecialization(request.getParameter("specialization"));
		app.setAppointment_date(java.sql.Date.valueOf(request.getParameter("appointmentDate")));
		String timeStr = request.getParameter("appointmentTime");
		if (timeStr != null && !timeStr.isEmpty()) {
			timeStr += ":00"; // append seconds to make it "HH:mm:ss"
			app.setAppointment_time(java.sql.Time.valueOf(timeStr));
		}

		app.setStatus(request.getParameter("status"));
		app.setContact_number(request.getParameter("contactNumber"));
		app.setEmail_address(request.getParameter("emailAddress"));
		app.setReason(request.getParameter("reason"));

		// Set current date for created_at
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		app.setCreated_at(currentDate);
		appointmentService service = new appointmentService();

		service.addAppointment(app);

		// Redirect to manageappointment servlet instead of directly to the JSP
		response.sendRedirect("manageappointment");
		// RequestDispatcher dispatcher = request.getRequestDispatcher("manage_appointments.jsp");
		// dispatcher.forward(request, response);
	}

}
