package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.healthcare_providerService ;

/**
 * servlet implementation class Allhealthcare_providerService 
 */
@WebServlet("/Allhealthcare_providerService ")
public class Allhealthcare_providerService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Allhealthcare_providerService () {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		healthcare_providerService  service = new healthcare_providerService ();
		
		ArrayList<model.healthcare_provider > allhealthcare_providerService  = service.getAllHealthcare_provider ();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("");


		  request.setAttribute("healthcare_provider", allhealthcare_providerService);
		  
	      dispatcher.forward(request, response);
	}

}