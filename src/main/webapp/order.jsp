<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OderModel" %>
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Orders - PharmaOnline</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">📦 Your Order Summary</h2>

  <table class="table table-bordered table-striped">
    <thead class="table-primary">
      <tr>
        <th>Order ID</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Payment</th>
        <th>Products</th>
        <th>Prescription</th>
        <th>Total (Rs.)</th>
        <th>Status</th>
        <th>Date</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <%
        ArrayList<OderModel> orderList = (ArrayList<OderModel>) request.getAttribute("orders");
        if (orderList != null && !orderList.isEmpty()) {
          for (OderModel order : orderList) {
      %>
      <tr>
        <td><%= order.getOrderID() %></td>
        <td><%= order.getAddress() %></td>
        <td><%= order.getTelephone() %></td>
        <td><%= order.getPayment() %></td>
        <td><%= order.getProducts() %></td>
        <td>
			  <%
			    String fileName = order.getPrescription();
			    if (fileName != null && !fileName.trim().isEmpty()) {
			  %>
			    <a href="uploads/<%= fileName %>" target="_blank">
			      <img src="uploads/<%= fileName %>" width="100" height="100" style="object-fit: cover; border-radius: 5px;">
			    </a>
			  <%
			    } else {
			  %>
			    <span>No prescription</span>
			  <%
			    }
			  %>
			</td>

        <td><%= order.getTotalPrice() %></td>
        <td><span class="badge bg-warning text-dark"><%= order.getStatus() %></span></td>
        <td><%= order.getDate() %></td>
        <td>
          <a href="updateOrder.jsp?id=<%= order.getOrderID() %>&address=<%= order.getAddress() %>&telephone=<%= order.getTelephone() %>" class="btn btn-sm btn-outline-primary mb-1">Update</a>
          <form action="DeleteOrderServlet" method="post" style="display:inline-block">
            <input type="hidden" name="orderID" value="<%= order.getOrderID() %>">
            <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% 
          } 
        } else { 
      %>
      <tr>
        <td colspan="9" class="text-center">No orders found.</td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
