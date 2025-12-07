package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Patient;
import services.PatientService;


@WebServlet("/SingleDataButton")
public class SingleDataButton extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SingleDataButton() {
        super();
  
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Patient pat = new Patient();
		pat.setEmail(request.getParameter("email"));
		PatientService service = new PatientService();
		Patient Patient = service.SingleDataButton(pat);
		RequestDispatcher dispatcher = request.getRequestDispatcher("PatientProfile.jsp");
		request.setAttribute("Patient", Patient);
		
		dispatcher.forward(request, response);
	}

}
