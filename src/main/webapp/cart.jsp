<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Cart - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">🛒 Your Cart</h2>

  <table class="table table-bordered table-hover">
    <thead class="table-primary">
      <tr>
        <th>Product Name</th>
        <th>Price (Rs.)</th>
        <th>Quantity</th>
        <th>Total (Rs.)</th>
        
      </tr>
    </thead>
    <tbody>
      <%
        ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
        double grandTotal = 0;
        if (cart != null && !cart.isEmpty()) {
          for (int i = 0; i < cart.size(); i++) {
            CartItem item = cart.get(i);
            double total = item.getPrice() * item.getQuantity();
            grandTotal += total;
      %>
      <tr>
        <td><%= item.getProductName() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getQuantity() %></td>
        <td><%= total %></td>
       
      </tr>
      <% 
          } 
        } else { 
      %>
      <tr>
        <td colspan="5" class="text-center">Your cart is empty.</td>
      </tr>
      <% } %>
    </tbody>
    <% if (cart != null && !cart.isEmpty()) { %>
    <tfoot class="table-secondary">
      <tr>
        <th colspan="3" class="text-end">Grand Total</th>
        <th>Rs. <%= grandTotal %></th>
      </tr>
    </tfoot>
    <% } %>
  </table>

  <div class="d-flex justify-content-between">
    <a href="medicine.jsp" class="btn btn-secondary">Continue Shopping</a>
    <% if (cart != null && !cart.isEmpty()) { %>
      <div>
        <form method="post" action="ClearCartServlet" style="display:inline;">
          <button type="submit" class="btn btn-outline-danger">Clear All Items</button>
        </form>
        <a href="checkout.jsp" class="btn btn-success ms-2">Proceed to Checkout</a>
      </div>
    <% } %>
  </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
