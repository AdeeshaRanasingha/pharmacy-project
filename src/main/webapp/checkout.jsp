<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String userIdStr = (String) session.getAttribute("userID");
  if (userIdStr == null) {
      response.sendRedirect("login.jsp");
      return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Checkout - PharmaOnline</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .error-msg {
      font-size: 0.9rem;
      color: red;
      margin-top: 4px;
    }
  </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">💳 Checkout</h2>

  <form id="checkoutForm" action="orderServlet" method="post">
    <div class="row g-3 mb-4">
      <!-- Full Name -->
      <div class="col-md-6">
        <label for="fullName" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullName">
        <div class="error-msg" id="nameError"></div>
      </div>

      <!-- Phone -->
      <div class="col-md-6">
        <label for="phone" class="form-label">Phone Number</label>
        <input type="tel" class="form-control" id="phone" name="phone">
        <div class="error-msg" id="phoneError"></div>
      </div>

      <!-- Address -->
      <div class="col-12">
        <label for="address" class="form-label">Delivery Address</label>
        <textarea class="form-control" id="address" name="address" rows="3"></textarea>
        <div class="error-msg" id="addressError"></div>
      </div>

      <!-- Payment Method -->
      <div class="col-12">
        <label for="paymentMethod" class="form-label">Payment Method</label>
        <select class="form-select" id="paymentMethod" name="paymentMethod">
          <option selected disabled value="">Choose...</option>
          <option value="Cash">Cash on Delivery</option>
          <option value="Card">Credit / Debit Card</option>
        </select>
        <div class="error-msg" id="paymentError"></div>
      </div>
    </div>

    <!-- Order Summary -->
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
            for (CartItem item : cart) {
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
        </tr>
      </tfoot>
    </table>

    <input type="hidden" name="total" value="<%= grandTotal %>">
    <input type="hidden" name="userID" value="<%= userIdStr %>">

    <div class="text-end">
      <button type="submit" class="btn btn-success">Confirm Order</button>
    </div>
  </form>
</div>

<jsp:include page="footer.jsp" />

<script>
  document.getElementById("checkoutForm").addEventListener("submit", function (e) {
    let valid = true;

    // Clear previous error messages
    document.querySelectorAll(".error-msg").forEach(el => el.innerText = "");

    // Name validation
    const name = document.getElementById("fullName");
    if (!/^[A-Za-z\s]{3,}$/.test(name.value.trim())) {
      document.getElementById("nameError").innerText = "Enter a valid name (min 3 letters)";
      name.value = "";
      valid = false;
    }

    // Phone validation
    const phone = document.getElementById("phone");
    if (!/^07[0-9]{8}$/.test(phone.value.trim())) {
      document.getElementById("phoneError").innerText = "Phone must start with 07 and be 10 digits";
      phone.value = "";
      valid = false;
    }

    // Address validation
    const address = document.getElementById("address");
    if (address.value.trim().length < 5) {
      document.getElementById("addressError").innerText = "Enter a valid address (min 5 chars)";
      address.value = "";
      valid = false;
    }

    // Payment method validation
    const payment = document.getElementById("paymentMethod");
    if (payment.value === "") {
      document.getElementById("paymentError").innerText = "Please select a payment method";
      valid = false;
    }

    if (!valid) {
      e.preventDefault();
    }
  });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
