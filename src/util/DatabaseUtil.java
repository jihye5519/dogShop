package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			String dbURL ="jdbc:oracle:thin:@39.117.227.234:1521/kdy0121";
			String dbID = "c##shop";
			String dbPassword = "shop";			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}		
}
