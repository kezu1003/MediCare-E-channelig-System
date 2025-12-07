package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.Request;

import model.Patient;
import services.PatientService;


@SuppressWarnings("unused")
@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PatientLogin() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	Patient pat = new Patient();
	
	String un = request.getParameter("name");
	
	pat.setEmail(request.getParameter("email"));
	pat.setPassword(request.getParameter("password"));
	
	
		PatientService service = new PatientService();
		boolean status = service.validate(pat);
		
		if(status) {
			
			HttpSession session = request.getSession();
			session.setAttribute("Patient", un);
			
			Patient loginedPat = service.getOne(pat);
			RequestDispatcher dispatcher = request.getRequestDispatcher("PatientProfile.jsp");
			request.setAttribute("Patient", loginedPat);
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("PatientLogin.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
