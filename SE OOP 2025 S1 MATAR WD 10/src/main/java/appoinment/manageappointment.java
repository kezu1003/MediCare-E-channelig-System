package appoinment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.appointment;
import services.appointmentService;

@WebServlet("/manageappointment")
public class manageappointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public manageappointment() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get all appointments
		appointmentService service = new appointmentService();

		ArrayList<appointment> appointments = service.getAllAppointment();

		// Set appointments attribute
		request.setAttribute("appointment", appointments);

		// Keep any message that was set by another servlet (like cancelAppointment)
		String message = (String) request.getAttribute("message");
		if (message != null) {
			request.setAttribute("message", message);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("manage_appointments.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		appointmentService service = new appointmentService();

		ArrayList<appointment> appointment = service.getAllAppointment();

		// Set appointments attribute
		request.setAttribute("appointment", appointment);

		// Keep any message that was set by another servlet (like cancelAppointment)
		String message = (String) request.getAttribute("message");
		if (message != null) {
			request.setAttribute("message", message);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("manage_appointments.jsp");
		dispatcher.forward(request, response);
	}

}
