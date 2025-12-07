package servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.healthcare_provider ;
import services.healthcare_providerService ;


@WebServlet("/Addhealthcare_provider")
public class Addhealthcare_provider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Addhealthcare_provider() {
        super();
        
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		healthcare_provider newhealthcare_provider = new healthcare_provider();
		
		newhealthcare_provider.setProvider_id(request.getParameter("providerId"));
		
		newhealthcare_provider.setProvider_name(request.getParameter("providerName"));
		
		newhealthcare_provider.setContact_number(request.getParameter("contactNumber"));
		
		newhealthcare_provider.setEmail(request.getParameter("email"));
		
		newhealthcare_provider.setServices(request.getParameter("Services"));
		
		
		healthcare_providerService hpService = new healthcare_providerService();
		
		hpService.addNewHealthcare_provider(newhealthcare_provider);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("addhealthcareprovider.jsp");
		
        dispatcher.forward(request, response);
		
	}

}