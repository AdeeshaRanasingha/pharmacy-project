<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">💳 Checkout</h2>

  <form action="orderServlet" method="post">
    <div class="row g-3 mb-4">
      <div class="col-md-6">
        <label for="fullName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullName" required>
      </div>
      <div class="col-md-6">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="number" class="form-control" id="phone" name="phone" required>
      </div>
      <div class="col-12">
        <label for="address" class="form-label">Delivery Address</label>
        <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
      </div>
      <div class="col-12">
        <label for="paymentMethod" class="form-label">Payment Method</label>
        <select class="form-select" id="paymentMethod" name="paymentMethod" required>
          <option selected disabled>Choose...</option>
          <option value="Cash">Cash on Delivery</option>
          <option value="Card">Credit / Debit Card</option>
        </select>
      </div>
    </div>

    <h4 class="mb-3">🧾 Order Summary</h4>
    <table class="table table-bordered">
      <thead class="table-light">
        <tr>
          <th>Item</th>
          <th>Qty</th>
          <th>Price (Rs.)</th>
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
          <td><%= item.getQuantity() %></td>
          <td><%= item.getPrice() %></td>
          <td><%= total %></td>
        </tr>
        <% 
            } 
          } 
        %>
      </tbody>
      <tfoot>
        <tr>
          <th colspan="3" class="text-end">Grand Total</th>
          
          
          <th>Rs. <%= grandTotal %></th>
          <input type="hidden" name="total" value="<%= grandTotal %>">
        </tr>
      </tfoot>
    </table>

    <div class="text-end">
      <button type="submit" class="btn btn-success">Confirm Order</button>
    </div>
  </form>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
