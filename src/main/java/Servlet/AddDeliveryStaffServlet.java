package Servlet; 

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DeliveryStaffModel;
import Services.DeliveryStaffServices;


@WebServlet("/AddDeliveryStaffServlet")
public class AddDeliveryStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddDeliveryStaffServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DeliveryStaffModel staff = new DeliveryStaffModel();
		
		staff.setFirstname(request.getParameter("firstname"));
		staff.setLastname(request.getParameter("lastname"));
		staff.setPhone(request.getParameter("phone"));
		staff.setAssignedArea(request.getParameter("assignedArea"));
		staff.setStatus(request.getParameter("status"));
		staff.setNotes(request.getParameter("notes"));
		
		DeliveryStaffServices service = new DeliveryStaffServices();
		
		boolean isInserted = service.insertData(staff);
		
		if (isInserted) {
			response.sendRedirect("DeliveryStaffListServlet");
        } else {
            request.setAttribute("error", "failed. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("addDeliveryStaff.jsp");
            dis.forward(request, response);
        }
		
		
		
	}

}
