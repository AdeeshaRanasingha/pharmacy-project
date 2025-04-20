package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartItem;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	
	

	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productName = request.getParameter("productName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        CartItem item = new CartItem(productName, quantity, price);

        HttpSession session = request.getSession();
        
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(item);
        session.setAttribute("cart", cart);

        // Redirect back to medicine page or a success message
        response.sendRedirect("medicine.jsp"); // or a cart summary page
    }

}
