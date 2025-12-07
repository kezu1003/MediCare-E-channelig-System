package services;

import java.sql.Statement;
import java.sql.Timestamp;



import model.LabTest_Model;
import utils.DBconnect;

public class LabTest_Service {
    
	public void TestDetails(LabTest_Model test) {
		
		try {
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());

			String query = "insert into labdatabase values ('"+ test.getHospitalName() + "','" + test.getEmail() + "','" + test.getContactNo() + "','" + test.getAddress() + "','" + timestamp.toString() + "','"+test.getTestName()+"','"+test.getTestPrice()+"')";
	        

			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}