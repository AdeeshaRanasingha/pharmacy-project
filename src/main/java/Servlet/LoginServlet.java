package Servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import Model.UserModel;
import Services.UserServices;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserServices userService = new UserServices();
        UserModel user = userService.loginUser(email, password);

        if (user != null) {
             // After login, redirect to home.jsp
            
            if(email.equals("adeeshaharshana@gmail.com")) {
            	HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("adminPanelServlet"); 
            }
            else {
            	HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userID", String.valueOf(user.getUserID()));
                response.sendRedirect("home.jsp");
                
            }
        } else {
            request.setAttribute("error", "Invalid email or password. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
