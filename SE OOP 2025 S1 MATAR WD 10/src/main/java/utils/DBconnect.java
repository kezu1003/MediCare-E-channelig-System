package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String username = "root";
		String password = "Mysql1602*";
		
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/echannelling_db?characterEncoding=utf8",username,password);
		 
		 return con;
	}
}
