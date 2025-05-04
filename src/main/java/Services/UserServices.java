package Services;



import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import Controller.DBConnector;
import Model.UserModel;

public class UserServices {
	
	

	//registration
	
	public boolean RegisterUser(UserModel user) {
		try {
			
			String firstname = user.getFirstname();
			String lastname = user.getLastname();
			String email = user.getEmail();
			String phone = user.getPhone();
			String password = user.getPassword();
			String User = "customer";
			
			
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();
			
			String query = "INSERT INTO user_info (firstname, lastname, email, phone, password , usertype) VALUES ('"
			        + firstname + "', '" + lastname + "', '" + email + "', '" + phone + "', '" + password + "', '" + User + "')";


			
			
			int success = stmt.executeUpdate(query);
			
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
			e.printStackTrace();
			return false;

		}
		
	
	}
	
	//login validation
	
	public UserModel loginUser(String email, String password) {
	    UserModel user = null;
	    try {
	        Connection conn = DBConnector.getConnection();
	        Statement stmt = conn.createStatement();
	        
	        String query = "SELECT * FROM user_info WHERE email='" + email + "' AND password='" + password + "'";
	        ResultSet rs = stmt.executeQuery(query);
	        
	        if (rs.next()) {
	            user = new UserModel();
	            user.setUserID(rs.getString("userID"));
	            user.setFirstname(rs.getString("firstname"));
	            user.setLastname(rs.getString("lastname"));
	            user.setEmail(rs.getString("email"));
	            user.setPhone(rs.getString("phone"));
	            user.setPassword(rs.getString("password"));
	        }
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}

	//get all user details
	
	public UserModel getUserDetails(String userID) {
		
		UserModel user = null;
		
		try {
			Connection conn = DBConnector.getConnection();
	        Statement stmt = conn.createStatement();
	        
	        String query = "SELECT * FROM user_info WHERE userID='"+ userID +"'";
	        ResultSet rs = stmt.executeQuery(query);
	        
	        if(rs.next()) {
	        	
	        	user = new UserModel();
	        	user.setUserID(rs.getString("userID"));
	        	user.setFirstname(rs.getString("firstname"));
	        	user.setLastname(rs.getString("lastname"));
	        	user.setEmail(rs.getString("email"));
	        	user.setPhone(rs.getString("phone"));
	        	user.setPassword(rs.getString("password"));
	        	user.setUsertype(rs.getString("usertype"));
	        	user.setPropicurl(rs.getString("propicurl"));
	        }
	        
	        conn.close();
			
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		return user;
		
		
		
	}
	
	//update password
	
	public boolean updatePassword(String userID, String currentPassword, String newPassword ) {
		
		try {
			
			Connection conn = DBConnector.getConnection();
	        Statement stmt = conn.createStatement();
	        
	        String query = "UPDATE user_info SET password = '"+newPassword+"' WHERE userID = '"+userID+"' ";
	        int updated = stmt.executeUpdate(query);
			
			conn.close();
			
			
			if(updated > 0) {
				
				return true;
			}
			else {
				return false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateUserDetails(String userID, String firstname, String lastname, String email, String phone) {
	    boolean isUpdated = false;

	    try {
	        Connection conn = DBConnector.getConnection();
	        String query = "UPDATE user_info SET firstname= '"+firstname+"', lastname='"+lastname+"', email='"+email+"', phone='"+phone+"' WHERE userID='"+userID+"'";
	        Statement stmt = conn.createStatement();
	        
	       
			
	        

	        int rowsAffected = stmt.executeUpdate(query);
	        if (rowsAffected > 0) {
	            isUpdated = true;
	        }

	        stmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isUpdated;
	}

	
	public boolean deleteUserAccount(String userID) {
	    boolean isDeleted = false;

	    try {
	        Connection conn = DBConnector.getConnection();
	        String query = "DELETE FROM user_info WHERE userID='"+userID+"'";
	        Statement stmt = conn.createStatement();
	        
	        int rowsAffected = stmt.executeUpdate(query);
	     
	        if (rowsAffected > 0) {
	            isDeleted = true;
	        }

	        stmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isDeleted;
	}



}
