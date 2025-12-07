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


@WebServlet("/addPatient")
public class addPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addPatient() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Patient pat = new Patient();
		
		pat.setName(request.getParameter("name"));
		pat.setAge(Integer.parseInt(request.getParameter("age")));
		pat.setEmail(request.getParameter("email"));
		pat.setPassword(request.getParameter("password"));
		
		PatientService service = new PatientService();
		service.regPatient(pat); 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("PatientLogin.jsp");
		
		
		dispatcher.forward(request, response);
	}
	

}
