package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserModel;
import Services.UserServices;


@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdatePasswordServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		UserModel user = (UserModel) session.getAttribute("user");
		
		
		
		String userID = user.getUserID();
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		
		if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "password do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("myAccount.jsp");
            dispatcher.forward(request, response);
            return;
        }
		
		 UserServices service = new UserServices();
	     boolean isUpdated = service.updatePassword(userID, currentPassword, newPassword);
	     
	     if (isUpdated) {
	            request.setAttribute("success", "Password updated successfully!");
	        } else {
	            request.setAttribute("error", "Current password is incorrect.");
	        }

	     
	     RequestDispatcher dispatcher = request.getRequestDispatcher("myAccount.jsp");
	     dispatcher.forward(request, response);
		
		
		
	}

}
