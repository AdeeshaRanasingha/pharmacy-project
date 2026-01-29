package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import Model.Feedback;
import Services.FeedbackService;

@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Create Feedback object
        Feedback fb = new Feedback();

        // Extract form values
        int userID = Integer.parseInt(request.getParameter("userID"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Set values into model
        fb.setUserID(userID);
        fb.setFirstname(firstname);
        fb.setLastname(lastname);
        fb.setEmail(email);
        fb.setPhone(phone);
        fb.setMessage(message);

        // Save to DB
        boolean result = FeedbackService.insertFeedback(fb);

        if (result) {
            response.sendRedirect("viewFeedback.jsp?status=success");
        } else {
            response.sendRedirect("feedback.jsp?status=error");
        }
    }
}
