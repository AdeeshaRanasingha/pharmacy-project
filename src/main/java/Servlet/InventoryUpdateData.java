package Servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InventoryModel;
import Services.InventoryService;



@WebServlet("/InventoryUpdateData")
public class InventoryUpdateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InventoryUpdateData() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 InventoryModel inmode5 = new InventoryModel();

        inmode5.setMedicineId(Integer.parseInt(request.getParameter("medID")));
        inmode5.setMedicineName(request.getParameter("medicineName"));
        inmode5.setCategory(request.getParameter("category"));
        inmode5.setdescription(request.getParameter("description"));
        inmode5.setUnitPrice(Integer.parseInt(request.getParameter("unitPrice")));
        inmode5.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        inmode5.setPrescriptionRequired(request.getParameter("prescriptionRequired"));
        inmode5.setExpiryDate(request.getParameter("expiryDate"));
        inmode5.setAddedDate(request.getParameter("addDate"));
        

        InventoryService service = new InventoryService();
        service.updateData(inmode5);

        response.sendRedirect("InventoryReadServelet"); // Redirect to event list
	}

}