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




@WebServlet("/myAccountServlet")
public class myAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public myAccountServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		UserModel loggedInUser = (UserModel) session.getAttribute("user");
		
		if (loggedInUser != null){
			String userID = loggedInUser.getUserID();
			
			UserServices service = new UserServices();
			UserModel user = service.getUserDetails(userID);
			
			if(user != null) {
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("myAccount.jsp");
				dispatcher.forward(request, response);
				
			}else {
				
				response.sendRedirect("login.jsp");
			}
			
			
		}else {
			
			response.sendRedirect("login.jsp");
		}
		
		
		
		
	}

}
