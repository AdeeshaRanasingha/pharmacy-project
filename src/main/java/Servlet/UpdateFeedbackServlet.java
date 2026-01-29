package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import Model.Feedback;
import Services.FeedbackService;

@WebServlet("/updateFeedback")
public class UpdateFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Feedback fb = new Feedback();

        // Get updated message and existing fields
        fb.setId(Integer.parseInt(request.getParameter("id")));
        fb.setFirstname(request.getParameter("firstname"));
        fb.setLastname(request.getParameter("lastname"));
        fb.setEmail(request.getParameter("email"));
        fb.setPhone(request.getParameter("phone"));
        fb.setMessage(request.getParameter("message"));

        boolean result = FeedbackService.updateFeedback(fb);

        if (result) {
            response.sendRedirect("viewFeedback.jsp?status=updated");
        } else {
            response.sendRedirect("updateFeedback.jsp?id=" + fb.getId() + "&status=error");
        }
    }
}
