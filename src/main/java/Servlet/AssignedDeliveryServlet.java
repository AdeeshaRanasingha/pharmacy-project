package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeliveryStaffModel;
import Services.DeliveryStaffServices;
import Services.orderServices;


@WebServlet("/AssignedDeliveryServlet")
public class AssignedDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AssignedDeliveryServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		int orderID = Integer.parseInt(request.getParameter("orderID"));
		String staffID = request.getParameter("staffID");
		
		if (staffID == null || staffID.trim().isEmpty()) {
		    request.setAttribute("error", "❌ Staff ID is missing.");
		    request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
		    return;
		}

		
		boolean isActive = orderServices.isStaffActive(staffID);
		
		if (!isActive) {
            request.setAttribute("error", "⚠ Cannot assign order. Delivery staff is suspended.");
            request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
            return;
        }
		
		boolean success = orderServices.assignOrderToStaff(orderID, staffID);
		
		
		if (success) {
            response.sendRedirect("ManageOrdersServlet");
        } else {
            request.setAttribute("error", "❌ Failed to assign order.");
            request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
        }
		
	}

}
