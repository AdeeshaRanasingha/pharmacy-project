package Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnector {
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:mysql://127.0.0.1:3306/pharmacyonline";
		String user = "root";
		String pwd = "";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,user,pwd);
		Statement stmt = conn.createStatement();
		
		
		return conn;
	}
	
	
}
