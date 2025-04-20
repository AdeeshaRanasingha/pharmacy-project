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

        CartItem item = new CartItem(productName, quantity, price);//created the cartItem object and inisialised the values

        HttpSession session = request.getSession();
        
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");//retriving the users cart

        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(item);//adds the current product (represented by the item object) to the cart list
        session.setAttribute("cart", cart);//saves the updated cart back into the session.

        
        response.sendRedirect("medicine.jsp"); 
    }

}
