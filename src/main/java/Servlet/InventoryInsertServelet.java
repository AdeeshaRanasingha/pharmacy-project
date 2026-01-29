package Servlet;

import java.io.IOException;

import java.util.Map;
import java.util.HashMap;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InventoryModel;
import Services.InventoryService;


@WebServlet("/InventoryInsertServelet")
public class InventoryInsertServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InventoryInsertServelet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Object errors;
	    Map<String,String> errors1 = new HashMap<>();
	    
	    


		
		InventoryModel InventMod = new InventoryModel();
		
		InventMod.setMedicineName(request.getParameter("medicineName"));
		InventMod.setdescription(request.getParameter("description"));
		InventMod.setCategory(request.getParameter("category"));
		InventMod.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		InventMod.setUnitPrice(Integer.parseInt(request.getParameter("unitPrice")));
		InventMod.setPrescriptionRequired(request.getParameter("prescriptionRequired"));
		InventMod.setExpiryDate(request.getParameter("expiryDate"));
		
		String exDateStr = request.getParameter("expiryDate");
		Map<String,String> errors11 = new HashMap<>();

		try {
		    LocalDate exDate = LocalDate.parse(exDateStr);
		    if (exDate.isBefore(LocalDate.now())) {
		        errors11.put("expiryDate", "Expiry date must be in the future.");
		    }
		} catch (DateTimeParseException e) {
		    errors11.put("expiryDate", "Invalid date format. Use YYYY-MM-DD.");
		}

		// later, check errors.isEmpty() before inserting...

		
		
		
		InventoryService service = new InventoryService();
		
		try {
			service.insertData(InventMod);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("InventoryReadServelet");
		doGet(request, response);
	}


}