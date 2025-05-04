package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeliveryStaffModel;
import Services.DeliveryStaffServices;


@WebServlet("/UpdateDeliveryStaffServlet")
public class UpdateDeliveryStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateDeliveryStaffServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DeliveryStaffModel staff = new DeliveryStaffModel();
		
		staff.setPhone(request.getParameter("phone"));
		staff.setAssignedArea(request.getParameter("assignedArea"));
		staff.setStatus(request.getParameter("status"));
		staff.setNotes(request.getParameter("notes"));
		staff.setStaffID(request.getParameter("staffID"));
		
		DeliveryStaffServices services = new DeliveryStaffServices();
		
		try {
			services.updateData(staff);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("DeliveryStaffListServlet");
		
		
		
	}

}
