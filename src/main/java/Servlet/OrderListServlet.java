package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.OderModel;
import Services.orderServices;


@WebServlet("/orderListServlet")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderListServlet() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            //HttpSession session = request.getSession();
            //int userID = (int) session.getAttribute("userID"); // ensure this is set on login

            List<OderModel> orders = orderServices.showData();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
