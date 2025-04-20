package Services;

import java.sql.Statement;

import Controller.DBConnector;
import Model.OderModel;

public class prescriptionServices {
	public void insertData(OderModel ordModel) {
		try {
            
            String address = ordModel.getAddress();
            int phone = ordModel.getTelephone();
            String payment = ordModel.getPayment();
            
            String prescription = ordModel.getPrescription(); // Save uploaded file info or prescription details
            String status = ordModel.getStatus();     // For example, "Pending"

            DBConnector db = new DBConnector();
            Statement stmt = db.getConnection().createStatement();

            String sql = "INSERT INTO `order` ( address, telephone, payment, prescription, status) " +
                         "VALUES ( '" + address + "', '" + phone + "', '" + payment + "',  '" + prescription + "', '" + status + "')";

            System.out.println("SQL: " + sql);
            stmt.execute(sql);
            System.out.println("✅ Prescription order inserted successfully.");

            stmt.close();
        } catch (Exception e) {
            System.out.println("❌ SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
