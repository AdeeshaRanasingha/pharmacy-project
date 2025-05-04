package Servlet;




import Services.UserServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.UserModel;

import java.io.IOException;

@WebServlet("/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserServices userServices;

    public void init() {
        userServices = new UserServices();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        UserModel user = (UserModel) session.getAttribute("user");


        if (user != null) {
            

            // Get updated fields from form
        	String userID = user.getUserID();
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

           

            

            boolean result = userServices.updateUserDetails(userID,firstname,lastname,email,phone);

            if (result) {
            	
            	user.setFirstname(firstname);
            	user.setLastname(lastname);
            	user.setEmail(email);
            	user.setPhone(phone);
            	session.setAttribute("user", user);
                // update session too
                request.setAttribute("message", "Account updated successfully.");
            } else {
                request.setAttribute("error", "Update failed. Please try again.");
            }

            
            RequestDispatcher dispatcher = request.getRequestDispatcher("myAccount.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
