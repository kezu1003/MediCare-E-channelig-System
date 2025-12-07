package services;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.healthcare_provider;
import utils.DBconnect;

public class healthcare_providerService {
	
	public void addNewHealthcare_provider(healthcare_provider hp) {
		
		try {
			
			String query = "insert into healthcare_provider values('"+hp.getProvider_id()+"','"+hp.getProvider_name()+"','"+hp.getContact_number()+"','"+hp.getEmail()+"','"+hp.getServices()+"')";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			statement.executeUpdate(query);
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	};
	
	public ArrayList<healthcare_provider> getAllHealthcare_provider(){
		
		try {
			
			ArrayList<healthcare_provider> ListHealthcare_provider  = new ArrayList<healthcare_provider>();
			
			String query = "select * from healthcare_provider";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				
			
				healthcare_provider hcp = new healthcare_provider();
				
				hcp.setProvider_id (rs.getString("provider_id "));
				hcp.setProvider_name(rs.getString("provider_name"));
				hcp.setContact_number(rs.getString("contact_number"));
				hcp.setEmail(rs.getString("email"));
				hcp.setServices(rs.getString("services"));
				
				ListHealthcare_provider.add(hcp);
				
				
			}
			
			return ListHealthcare_provider;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return null;
		}
	};
	
	
	public void updatehealthcare_provider(healthcare_provider hcp) {
		
		try {
			
			String query = "update healthcare_provider set provider_name='"+hcp.getProvider_name()+"',contact_number='"+hcp.getContact_number()+"',email='"+hcp.getEmail()+"',services = '"+hcp.getServices()+"' where provider_id='"+hcp.getProvider_id()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			statement.executeUpdate(query);
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	};
	
	public void Deletehealthcare_provider(healthcare_provider hcp) {
		
		try {
			
			String query = "delete from healthcare_provider where provider_id = '"+hcp.getProvider_id()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	};
	

}