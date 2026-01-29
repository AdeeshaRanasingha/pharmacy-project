package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeliveryStaffModel;
import Model.OderModel;
import Services.DeliveryStaffServices;
import Services.orderServices;


@WebServlet("/ManageOrdersServlet")
public class ManageOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ManageOrdersServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");

		if ("assign".equals(action)) {
		    int orderID = Integer.parseInt(request.getParameter("orderID"));
		    List<DeliveryStaffModel> activeStaffList = DeliveryStaffServices.getActiveStaff();
		    request.setAttribute("orderID", orderID);
		    request.setAttribute("activeStaffList", activeStaffList);
		    request.getRequestDispatcher("assignedDelivery.jsp").forward(request, response);
		} else {
		    List<OderModel> orders = orderServices.showDataAdmin();
		    request.setAttribute("orderList", orders);
		    request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
		}

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int orderID = Integer.parseInt(request.getParameter("orderID"));
	    String staffID = request.getParameter("staffID");

	    boolean success = orderServices.assignOrderToStaff(orderID, staffID);

	    if (success) {
	        request.setAttribute("message", "✅ Order assigned successfully.");
	    } else {
	        request.setAttribute("error", "❌ Failed to assign order.");
	    }

	    // Reload order list after update
	    List<OderModel> orders = orderServices.showDataAdmin();
	    request.setAttribute("orderList", orders);
	    request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
	}


}
