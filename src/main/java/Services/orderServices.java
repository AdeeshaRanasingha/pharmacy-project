package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnector;
import Model.OderModel;

public class orderServices {
	
	public void insertData(OderModel ordModel) {
	    try {
	        String name = ordModel.getName();
	        String address = ordModel.getAddress();
	        int phone = ordModel.getTelephone(); // ✅ added
	        String payment = ordModel.getPayment();
	        double total = ordModel.getTotalPrice();
	        String products = ordModel.getProducts();
	        String status = "Pending"; // ✅ added

	        DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();

	        String sql = "INSERT INTO `order` (address, telephone, payment, total, products, status) " +
	                     "VALUES ('" + address + "', '" + phone + "', '" + payment + "', '" + total + "', '" + products + "', '" + status + "')";

	        System.out.println("SQL: " + sql);
	        stmt.execute(sql);
	        System.out.println("✅ SQL executed successfully.");

	    } catch (Exception e) {
	        System.out.println("❌ SQL Error: " + e.getMessage());
	        e.printStackTrace();
	    }
	}


	
	public static List<OderModel> showData() {
		
	    ArrayList<OderModel> orderList = new ArrayList<>();

	    try {
	        DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();

	        String sql = "SELECT * FROM `order` ";
	        ResultSet rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            OderModel order = new OderModel();
	            order.setOrderID(rs.getInt("orderID"));
	            order.setAddress(rs.getString("address"));
	            order.setTelephone(rs.getInt("telephone"));
	            order.setPayment(rs.getString("payment"));
	            order.setProducts(rs.getString("products"));
	            order.setPrescription(rs.getString("prescription"));
	            order.setTotalPrice(rs.getDouble("total"));
	            order.setStatus(rs.getString("status"));
	            order.setDate(rs.getString("date"));
	            orderList.add(order);
	        }

	        rs.close();
	        stmt.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return orderList;
	}

	
	public void deleteData(int orderID) {
		
		try {
			
			DBConnector db = new DBConnector();
	        Statement stmt = db.getConnection().createStatement();

	        String sql = "DELETE FROM `order` WHERE orderID =  " + orderID;
	        
	        System.out.println("🟨 Executing SQL: " + sql);
	        int rows = stmt.executeUpdate(sql);
	        
	        System.out.println("✅ Rows deleted: " + rows);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateData(OderModel ordModel) throws ClassNotFoundException, SQLException {
		int phone = ordModel.getTelephone();
		String address = ordModel.getAddress();
		int orderID = ordModel.getOrderID();
		
		DBConnector db = new DBConnector();
        Statement stmt = db.getConnection().createStatement();
		
		String sql = "UPDATE `order` SET telephone = '"+phone+"', address = '"+address+"' WHERE orderID = '"+orderID+"'";
		
		int rows = stmt.executeUpdate(sql);
			
	}
}
