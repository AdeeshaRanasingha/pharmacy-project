package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.DeliveryStaffServices;


@WebServlet("/DeleteDeliveryStaffServlet")
public class DeleteDeliveryStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteDeliveryStaffServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String staffID = request.getParameter("staffID");
		DeliveryStaffServices service = new DeliveryStaffServices();
		
		service.deleteData(staffID);
		
        System.out.println("✅ Deletion requested for staff ID: " +staffID);
		
		response.sendRedirect("DeliveryStaffListServlet");
		
		doGet(request, response);
	}

}
