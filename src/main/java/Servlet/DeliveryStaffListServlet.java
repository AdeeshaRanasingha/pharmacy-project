package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeliveryStaffModel;
import Services.DeliveryStaffServices;


@WebServlet("/DeliveryStaffListServlet")
public class DeliveryStaffListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeliveryStaffListServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<DeliveryStaffModel>staff = DeliveryStaffServices.showData();
		
		// Debugging: Log the size of the staff list
        System.out.println("Number of delivery staff retrieved: " + (staff != null ? staff.size() : "null"));
        
		request.setAttribute("staff", staff);
		RequestDispatcher dispatcher = request.getRequestDispatcher("deliveryStaff.jsp");
		dispatcher.forward(request, response);
		
	}
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }

}
