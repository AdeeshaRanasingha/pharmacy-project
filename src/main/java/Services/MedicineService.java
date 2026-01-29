package Services;

import java.sql.*;
import java.util.ArrayList;

import Controller.DBConnector;
import Model.InventoryModel;

public class MedicineService {
    public static ArrayList<InventoryModel> getAllMedicines() {
        ArrayList<InventoryModel> list = new ArrayList<>();
        try {
        	
        	DBConnector db = new DBConnector();
            Connection con = db.getConnection(); 
            Statement stmt = con.createStatement();
	        
        	
            ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");

            while (rs.next()) {
                InventoryModel med = new InventoryModel();
                med.setMedicineId(rs.getInt("medID"));
                med.setMedicineName(rs.getString("medName"));
                med.setdescription(rs.getString("description"));
                med.setCategory(rs.getString("catogary"));
                med.setQuantity(rs.getInt("qnt"));
                med.setUnitPrice((int) rs.getDouble("unitPrice"));
                list.add(med);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
