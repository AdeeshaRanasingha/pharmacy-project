package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.InventoryService;
import Services.orderServices;


@WebServlet("/InventoryDeleteServelet")
public class InventoryDeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InventoryDeleteServelet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryService service = new InventoryService();
		
		service.deleteData(Integer.parseInt(request.getParameter("medID")));
		
		System.out.println("Deletion requested for medicine ID: " + Integer.parseInt(request.getParameter("medID")));
		
		response.sendRedirect("InventoryReadServelet");
		
	}

}
