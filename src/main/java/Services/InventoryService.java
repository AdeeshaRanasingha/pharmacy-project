package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnector;
import Model.InventoryModel;
import Model.OderModel;

public class InventoryService {

	public void insertData(InventoryModel inmod) throws ClassNotFoundException, SQLException{
		
		String medname = inmod.getMedicineName();
		String description= inmod.getdescription();
		String cat=inmod.getCategory();
		int qnt=inmod.getQuantity();
		int price=inmod.getUnitPrice();
		String prescrip=inmod.getPrescriptionRequired();
		String exDate=inmod.getExpiryDate();
		
		DBConnector db = new DBConnector();
        Statement stmt = db.getConnection().createStatement();
		
        String sql= "INSERT INTO `inventory` (medName,catogary,unitPrice,qnt,prescriptionReq,exDate,description)"
+ "VALUES ('"+medname+"', '"+cat+"', '"+price+"','"+qnt+"','"+prescrip+"', '"+exDate+"', '"+description+"')";	
        
        stmt.execute(sql);
        
	
	}
	
	
	public static List<InventoryModel> readData() throws ClassNotFoundException, SQLException{
		
		ArrayList <InventoryModel> invArr=new ArrayList<>();
		
		DBConnector db = new DBConnector();
        Statement stmt = db.getConnection().createStatement();
        
        String sql= "SELECT * FROM `inventory`";
        ResultSet rs= stmt.executeQuery(sql);
        
        while(rs.next()) {
        	
        	InventoryModel inmod = new InventoryModel();
        	
        	inmod.setMedicineId(rs.getInt("medID"));
        	inmod.setMedicineName(rs.getString("medName"));
        	inmod.setCategory(rs.getString("catogary"));
        	inmod.setUnitPrice(rs.getInt("unitPrice"));
        	inmod.setQuantity(rs.getInt("qnt"));
        	inmod.setPrescriptionRequired(rs.getString("prescriptionReq"));
        	inmod.setExpiryDate(rs.getString("exDate"));
        	inmod.setAddedDate(rs.getString("addedDate"));
        	inmod.setdescription(rs.getString("description"));
        	
        	invArr.add(inmod);
        }
        
        return invArr;
	}
	
	
	public void deleteData(int medID) {
      try {
			
			DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();

	        String sql = "DELETE FROM `inventory` WHERE medID =  " + medID;
	        
	    
	        int rows = stmt.executeUpdate(sql);
	        

			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public void updateData(InventoryModel inmode4) {
	    try {
	    	DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();
	        
	        String sql = "UPDATE inventory SET " +
	                "medname='" + inmode4.getMedicineName() + "', " +
	                "catogary='" + inmode4.getCategory() + "', " +
	                "unitPrice='" + inmode4.getUnitPrice() + "', " +
	                "qnt='" + inmode4.getQuantity()+ "', " +
	                "prescriptionReq='" + inmode4.getPrescriptionRequired()+ "', " + // Escaped package
	                "description='" + inmode4.getdescription() + "', " +
	                "exDate='" + inmode4.getExpiryDate() + "', " + // Added comma
	                "addedDate='" + inmode4.getAddedDate() + "' " + // Fixed quotes
	                "WHERE medID='" + inmode4.getMedicineId() + "'";

	        stmt.executeUpdate(sql);
	        stmt.close(); // Ensure statement is closed after execution
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
	public static InventoryModel getmedicineById(int medID) {
	    InventoryModel inmode7 = null;
	    try {
	    	
	    	DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();
	        
			
	        String sql = "SELECT * FROM inventory WHERE medID='" + medID + "'";
	        ResultSet rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	        	inmode7 = new InventoryModel();
	        	inmode7.setMedicineId(rs.getInt("medID"));
	        	inmode7.setMedicineName(rs.getString("medName"));
	        	inmode7.setCategory(rs.getString("catogary"));;
	        	inmode7.setUnitPrice(rs.getInt("unitPrice"));;
	        	inmode7.setQuantity(rs.getInt("qnt")); ;
	        	inmode7.setPrescriptionRequired(rs.getString("prescriptionReq"));;
	        	inmode7.setdescription(rs.getString("description"));;
	        	inmode7.setExpiryDate(rs.getString("exDate"));;
	        	inmode7.setAddedDate(rs.getString("addedDate"));;
	        	
	        	
				
	        }

	        rs.close();
	        stmt.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return inmode7;
	}
	
	
}
