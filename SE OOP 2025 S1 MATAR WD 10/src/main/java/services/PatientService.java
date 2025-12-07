package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Patient;
import utils.DBconnect;

public class PatientService {
	
	public void regPatient(Patient pat) {
		try {
			
			String query = "insert into patient values('"+pat.getEmail()+"','"+pat.getName()+"','"+pat.getAge()+"','"+pat.getPassword()+"')" ;
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean validate(Patient pat) {
		
		try {
			
			String query = "select * from patient where email = '"+pat.getEmail()+"' and password= '"+pat.getPassword()+"'";
			
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
	
public Patient getOne(Patient pat) {
		
		try {
			
			String query = "select * from patient where email = '"+pat.getEmail()+"' and password= '"+pat.getPassword()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			if(rs.next()) {
				pat.setName(rs.getString("name"));
				pat.setAge(rs.getInt("age"));
				pat.setEmail(rs.getString("email"));
				pat.setPassword(rs.getString("password"));
				return pat;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return null;
		
	}

	public ArrayList<Patient> getAllPatient(){
		try {
			ArrayList<Patient> listPat = new ArrayList<Patient>();
			
			String query = "select * from Patient";
			
			Statement statement = DBconnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()) {
				
				Patient pat = new Patient();
				pat.setName(rs.getString("name"));
				pat.setAge(rs.getInt("age"));
				pat.setEmail(rs.getString("email"));
				pat.setPassword(rs.getString("password"));
				listPat.add(pat);
			}
			return listPat;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}
		
	}
	
public Patient SingleDataButton(Patient pat) {
		
		try {
			
			String query = "select * from patient where email = '"+pat.getEmail()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			if(rs.next()) {
				pat.setName(rs.getString("name"));
				pat.setAge(rs.getInt("age"));
				pat.setEmail(rs.getString("email"));
				pat.setPassword(rs.getString("password"));
				return pat;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return null;
		
	}

	
	public void UpdatePatient(Patient Patient) {
		try {
			
			String query = "update patient SET name= '"+Patient.getName()+"',age= '"+Patient.getAge()+"',email='"+Patient.getEmail()+"',password = '"+Patient.getPassword()+"'where email = '"+Patient.getEmail()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void DeletePatient(Patient pat) {
		try {
			
			String query = "Delete from patient where email = '"+pat.getEmail()+"'";
			
			Statement statement = DBconnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}


