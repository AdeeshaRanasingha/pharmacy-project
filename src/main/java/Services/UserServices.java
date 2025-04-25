package Services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import Controller.DBConnector;
import Model.UserModel;

public class UserServices {
	
	//registration
	
	public static boolean IsRegisterUser(UserModel user) {
		try {
			
			String name = user.getFullname();
			String email = user.getEmail();
			String phone = user.getPhone();
			String password = user.getPassword();
			String usertype = user.getUsertype();
			String propicurl = user.getPropicurl();
			
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();
			String query = "INSERT INTO user_info (fullname,email,phone,password,usertype,propicurl) VALUES ('"+0+"' , '"+name+"' , '"+email+"' , '"+phone+"', '"+password+"', '"+usertype+"', '"+propicurl+"')";
			stmt.executeUpdate(query); //executeUpdate used for CREATE,UPDATE,DELETE
			int success = stmt.executeUpdate(query); //executeUpdate used for CREATE,UPDATE,DELETE
			
			//close connection
			conn.close();
			
			if(success > 0) {
				return true;
			}
			else{
				return false;
			}

			
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
	
	}
	
	//loginValidation
	
	
	/*public static boolean isValidUser(String email,String password) {
		try {
			
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM user_info WHERE email = '" + email + "' AND password = '" + password + "' LIMIT 1";

			ResultSet rs = stmt.executeQuery(query); // executeQuery used for READ
			if(rs.next()) {
				//retrive all user data
				int id = rs.getInt("id");
				String fullname = rs.getString("fullname");
				String Password = rs.getString("password");
				String Email= rs.getString("email");
				String phone = rs.getString("phone");
				String usertype = rs.getString("usertype");
				String propicUrl = rs.getString("profilepic_url");

				//create user object
				 UserModel user = new UserModel(id, fullname, Password, Email, phone,usertype,propicUrl);
				
				//close connection
				conn.close();
				
				return user; //return user object
			}
			else {
				return null;
			}
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}*/

	
}
