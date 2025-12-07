package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LabTest_Model;
import services.LabTest_Service;

@WebServlet("/LabTest_Servlet")
public class LabTest_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LabTest_Servlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LabTest_Model test=new LabTest_Model();
		test.setHospitalName(request.getParameter("hospitalName"));
		test.setEmail(request.getParameter("email"));
		test.setContactNo(request.getParameter("contactNo"));
		test.setAddress(request.getParameter("address"));
		
		  test.setTestPrice(Integer.parseInt(request.getParameter("labTest"))); 
		 
		  test.setDate(new java.sql.Timestamp(System.currentTimeMillis()));
		 
		
		LabTest_Service service=new LabTest_Service();
		service.TestDetails(test);
		
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("LabHome.jsp");
		dispatcher.forward(request, response);
	}

}
