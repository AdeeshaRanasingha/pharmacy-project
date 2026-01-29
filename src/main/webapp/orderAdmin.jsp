<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OderModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Your Orders - MyPharmacy</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap & Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

  <style>
    body { background-color: #f4f7fd; display: flex; font-family: 'Segoe UI', sans-serif; }
    .sidebar {
      width: 250px; height: 100vh; background:#fff; position:fixed; top:0; left:0;
      padding:20px; box-shadow:2px 0 5px rgba(0,0,0,0.1); display:flex; flex-direction:column;
    }
    .sidebar h2 { color:#6a5acd; text-align:center; margin-bottom:30px; }
    .sidebar a {
      color:#333; text-decoration:none; padding:12px 10px; border-radius:6px;
      display:flex; align-items:center; transition:background .2s;
    }
    .sidebar a:hover { background:#f0f0ff; color:#6a5acd; }
    .main-content { margin-left:250px; width:100%; padding:40px 20px; }
    .logout-link { margin-top:auto; color:red; font-weight:bold; }
    .logout-link:hover { color:darkred; }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <h2>eRemedy</h2>
    <a href="adminPanelServlet"><i class="fas fa-tachometer-alt"></i>&nbsp; Dashboard</a>
    <a href="InventoryReadServelet"><i class="fas fa-pills"></i>&nbsp; Manage Medicines</a>
    <a href="Inventory.jsp"><i class="fas fa-user-nurse"></i>&nbsp; Add Medicine</a>
    <a href="#"><i class="fas fa-users"></i>&nbsp; Manage Customers</a>
    <a href="orderListServlet"><i class="fas fa-clipboard-list"></i>&nbsp; Orders</a>
    <a href="addDeliveryStaff.jsp"><i class="fas fa-truck"></i>&nbsp; Add Delivery Staff</a>
    <a href="DeliveryStaffListServlet"><i class="fas fa-list-ul"></i>&nbsp; Delivery Staff Management</a>
    <a href="ManageOrdersServlet"><i class="fas fa-list-ul"></i>&nbsp; Manage Orders</a>
    <a href="adminViewFeedback.jsp"><i class="fas fa-list-ul"></i>&nbsp; Messages</a>
    <a href="LogoutServlet" class="logout-link"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="container-fluid">
      <h3 class="mb-4">Orders</h3>

      <table class="table table-bordered table-striped align-middle">
        <thead class="table-primary">
          <tr>
            <th>Order ID</th>
            <th>User</th>
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
            ArrayList<OderModel> orderList = 
                (ArrayList<OderModel>) request.getAttribute("orders");
            if (orderList != null && !orderList.isEmpty()) {
              for (OderModel order : orderList) {
          %>
          <tr>
            <td><%= order.getOrderID() %></td>
            <td><%= order.getUserID() %></td>
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
                  <img src="uploads/<%= fileName %>" width="80" height="80" 
                       style="object-fit:cover; border-radius:4px;">
                </a>
              <% } else { %>
                <span>No prescription</span>
              <% } %>
            </td>
            <td>Rs. <%= order.getTotalPrice() %></td>
            <td><span class="badge bg-warning text-dark"><%= order.getStatus() %></span></td>
            <td><%= order.getDate() %></td>
            <td>
              <a href="updateOrder.jsp?id=<%= order.getOrderID() %>&address=<%= order.getAddress() %>&telephone=<%= order.getTelephone() %>"
                 class="btn btn-sm btn-outline-primary mb-1">Update</a>
              <form action="DeleteOrderServlet" method="post" style="display:inline-block">
                <input type="hidden" name="orderID" value="<%= order.getOrderID() %>">
                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
              </form>
            </td>
          </tr>
          <%  }
            } else { %>
          <tr>
            <td colspan="11" class="text-center py-4">No orders found.</td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
