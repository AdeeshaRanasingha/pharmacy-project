package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.InventoryModel;
import Services.InventoryService;


@WebServlet("/InventoryUpdateIDServelet")
public class InventoryUpdateIDServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InventoryUpdateIDServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InventoryModel InventMod = new InventoryModel();
		
		InventMod.setMedicineId(Integer.parseInt(request.getParameter("medID")));
		
		
		
		InventoryService service = new InventoryService();
		
		service.getmedicineById(Integer.parseInt(request.getParameter("medID")));
		
		response.sendRedirect("InventoryUpdate.jsp");
		
		doGet(request, response);
	}

}
