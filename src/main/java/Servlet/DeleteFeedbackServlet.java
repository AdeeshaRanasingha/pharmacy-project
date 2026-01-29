package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import Services.FeedbackService;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        boolean result = false;

        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            result = FeedbackService.deleteFeedbackById(id);
        }

        if (result) {
            response.sendRedirect("viewFeedback.jsp?status=deleted");
        } else {
            response.sendRedirect("viewFeedback.jsp?status=error");
        }
    }
}
