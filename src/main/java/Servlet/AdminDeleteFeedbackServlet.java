package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

import Services.FeedbackService;

@WebServlet("/adminDeleteFeedback")
public class AdminDeleteFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean result = FeedbackService.deleteFeedbackById(id);

        if (result) {
            response.sendRedirect("adminViewFeedback.jsp?status=deleted");
        } else {
            response.sendRedirect("adminViewFeedback.jsp?status=error");
        }
    }
}
