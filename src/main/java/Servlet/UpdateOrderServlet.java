package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.OderModel;
import Services.orderServices;


@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateOrderServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OderModel ordModel = new OderModel();
		
		
		ordModel.setAddress(request.getParameter("address"));
		ordModel.setTelephone(Integer.parseInt(request.getParameter("phone")));
		ordModel.setOrderID(Integer.parseInt(request.getParameter("orderID")));
		
		orderServices service = new orderServices();
		try {
			service.updateData(ordModel);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("OrderListByIDServlet");
		
	}

}
