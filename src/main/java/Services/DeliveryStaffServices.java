package Services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnector;
import Model.DeliveryStaffModel;


public class DeliveryStaffServices {
	
	public boolean insertData(DeliveryStaffModel staff) {
		try {
			
			String firstname = staff.getFirstname();
			String lastname = staff.getLastname();
			String phone = staff.getPhone();
			String assignedArea = staff.getAssignedArea();
			String status = staff.getStatus();
			String notes = staff.getNotes();
			
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();
			

			String query = "INSERT INTO delivery_staff (firstname, lastname, phone, area, status , notes) VALUES ('"
			        + firstname + "', '" + lastname + "', '" + phone + "', '" + assignedArea + "', '" + status + "', '" + notes + "')";

			
			
			int success = stmt.executeUpdate(query);
			
			conn.close();
			
			if(success > 0) {
				return true;
			}
			else{
				return false;
			}
			
			
			
			
			
			
		}catch(Exception e){
			
			
			e.printStackTrace();
			return false;
			
		}
	}
	
	
	public static List<DeliveryStaffModel> showData(){
		
		ArrayList<DeliveryStaffModel> staffList = new ArrayList<>();
		
		try {
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();
			
			String query = "SELECT * FROM delivery_staff ";
			ResultSet rs = stmt.executeQuery(query);
			
			 while (rs.next()) {
				 
				 DeliveryStaffModel staff = new DeliveryStaffModel();
				 staff.setStaffID(rs.getString("staffID"));
				 staff.setFirstname(rs.getString("firstname"));
				 staff.setLastname(rs.getString("lastname"));
				 staff.setPhone(rs.getString("phone"));
				 staff.setAssignedArea(rs.getString("area"));
				 staff.setStatus(rs.getString("status"));
				 staff.setNotes(rs.getString("notes"));
<<<<<<< Updated upstream
				 staff.setDate(rs.getString("date"));
=======
				 staff.setDate(rs.getString("created_date"));
>>>>>>> Stashed changes
				 
				 staffList.add(staff);
			 }
			
			 rs.close();
		     stmt.close();
		     
		  // Debugging: Log the number of records retrieved
		        System.out.println("Total delivery staff records fetched: " + staffList.size());
			 
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return staffList;
	}
	
	
	
	public void updateData(DeliveryStaffModel staff) throws ClassNotFoundException, SQLException {
		
		String staffID = staff.getStaffID();
		String phone = staff.getPhone();
		String area = staff.getAssignedArea();
		String status = staff.getStatus();
		String notes = staff.getNotes();
		
		
		
		Connection conn = DBConnector.getConnection();
		Statement stmt = conn.createStatement();
		
		String query = "UPDATE delivery_staff SET phone = '"+phone+"', area = '"+area+"' , status = '"+status+"' , notes = '"+notes+"' WHERE staffID = '"+staffID+"'";
		
		int rows = stmt.executeUpdate(query);
		System.out.println("Rows updated: " + rows);

		
		stmt.close();
		conn.close();
		
		
			
	}
	
	
public void deleteData(String staffID) {
		
		try {
			
			Connection conn = DBConnector.getConnection();
			Statement stmt = conn.createStatement();

	        String query = "DELETE FROM delivery_staff WHERE staffID =  " + staffID;
	        
	        System.out.println("🟨 Executing SQL: " + query);
	        int rows = stmt.executeUpdate(query);
	        
	        System.out.println("✅ Rows deleted: " + rows);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

<<<<<<< Updated upstream
=======

public static List<DeliveryStaffModel> getAvailableStaff() {
    List<DeliveryStaffModel> staffList = new ArrayList<>();
    try {
    	Connection conn = DBConnector.getConnection();
		Statement stmt = conn.createStatement();
        String query = "SELECT * FROM delivery_staff WHERE status != 'Suspended'";
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            DeliveryStaffModel staff = new DeliveryStaffModel();
            staff.setStaffID(rs.getString("staffID"));
            staff.setFirstname(rs.getString("firstname"));
            staff.setLastname(rs.getString("lastname"));
            // Add other fields as needed
            staffList.add(staff);
        }
        rs.close();
        stmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return staffList;
}

public static List<DeliveryStaffModel> getActiveStaff() {
    List<DeliveryStaffModel> list = new ArrayList<>();
    try {
        DBConnector db = new DBConnector();
        Statement stmt = db.getConnection().createStatement();
        String sql = "SELECT * FROM delivery_staff WHERE status = 'Active'";
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            DeliveryStaffModel staff = new DeliveryStaffModel();
            staff.setStaffID(rs.getString("staffID"));
            staff.setFirstname(rs.getString("firstname"));
            staff.setLastname(rs.getString("lastname"));

            list.add(staff);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}



>>>>>>> Stashed changes
}
