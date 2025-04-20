package Servlet;

import java.util.List;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Model.CartItem;
import Model.OderModel;
import Services.orderServices;


@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public orderServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OderModel ordModel = new OderModel();
		
		ordModel.setName(request.getParameter("name"));
		ordModel.setAddress(request.getParameter("address"));
		ordModel.setTelephone(Integer.parseInt(request.getParameter("phone")));
		ordModel.setPayment(request.getParameter("paymentMethod"));
		ordModel.setTotalPrice(Double.parseDouble(request.getParameter("total")));

		
		HttpSession session = request.getSession(); 
		
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

		// Initialize the orderedItems string
		String orderedItems = "";

		// Loop through each item and build the string
		if (cart != null && !cart.isEmpty()) {
		    for (CartItem item : cart) {
		        orderedItems += item.getProductName() + " (" + item.getQuantity() + "), ";
		    }

		}
		
		ordModel.setProducts(orderedItems);
		
		orderServices service = new orderServices();
		
		service.insertData(ordModel);
		
		System.out.println("✅ Order insert triggered.");

		
		response.sendRedirect("orderListServlet");

	}

}
