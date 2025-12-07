package services;

import java.sql.ResultSet;
import java.sql.Statement;
import utils.DBconnect;
import model.signUp;

public class signUpservice {
	
	public void addsignUp(signUp sign) {
		try {
			
			String query = "insert into login values('"+sign.getEmail_address()+"','"+sign.getPassword()+"')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public boolean validate(signUp sign) {
		try {
			
			String query = "select * from login where email_Address = '"+sign.getEmail_address()+"' and password = '"+sign.getPassword()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;

	}
}
