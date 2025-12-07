package servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.healthcare_providerService ;


@WebServlet("/Deletehealthcare_provider")
public class Deletehealthcare_provider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Deletehealthcare_provider() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		model.healthcare_provider hcp = new model.healthcare_provider();
		
		hcp.setProvider_id(request.getParameter("Provider_id"));
		
		healthcare_providerService  service = new healthcare_providerService ();
		
		service.Deletehealthcare_provider(hcp);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("healthcareprovider.jsp");
		
		dispatcher.forward(request, response);
	}

}
