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


@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteAccountServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
		    response.sendRedirect("login.jsp");
		    return;
		}
		UserModel user = (UserModel) session.getAttribute("user");

		
		String userID = user.getUserID();
		
		UserServices service = new UserServices();
	
		boolean isDeleted = service.deleteUserAccount(userID);

        if (isDeleted) {
            session.invalidate(); // log the user out
            response.sendRedirect("register.jsp?message=AccountDeleted");
        } else {
            request.setAttribute("error", "Account deletion failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("myAccount.jsp");
            dispatcher.forward(request, response);
        }
		
		
		
		
		
	}

}
