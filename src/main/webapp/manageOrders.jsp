<%@ page import="java.util.*, Model.OderModel, Model.DeliveryStaffModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fd;
            display: flex;
            font-family: 'Segoe UI', sans-serif;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #ffffff;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            z-index: 1000;
        }

        .sidebar h2 {
            color: #6a5acd;
            margin-bottom: 30px;
            text-align: center;
        }

        .sidebar a {
            text-decoration: none;
            color: #333;
            padding: 12px 10px;
            font-size: 16px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            transition: background 0.2s;
        }

        .sidebar a:hover {
            background-color: #f0f0ff;
            color: #6a5acd;
        }

        .logout-link {
            margin-top: auto;
            color: red;
            font-weight: bold;
        }

        .logout-link:hover {
            color: darkred;
        }

        .main-content {
            margin-left: 250px;
            padding: 40px 20px;
            width: 100%;
        }
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
  <div class="container">
    <h2 class="mb-4"><i class="fas fa-clipboard-list"></i> Manage Orders</h2>
    <table class="table table-bordered table-hover">
      <thead class="table-light">
        <tr>
          <th>Order ID</th>
          <th>Customer ID</th>
          <th>Address</th>
          <th>Date</th>
          <th>Status</th>
          <th>Delivery</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<OderModel> orderList = (List<OderModel>) request.getAttribute("orderList");
          List<DeliveryStaffModel> activeStaffList = (List<DeliveryStaffModel>) request.getAttribute("activeStaffList");

          if (orderList != null) {
              for (OderModel order : orderList) {
                  String status = order.getStatus();
                  boolean isShipped = "shipped".equalsIgnoreCase(status);
        %>
        <tr>
          <td><%= order.getOrderID() %></td>
          <td><%= order.getUserID() %></td>
          <td><%= order.getAddress() %></td>
          <td><%= order.getDate() %></td>
          <td>
            <% if ("pending".equalsIgnoreCase(status)) { %>
              <span class="badge bg-warning text-dark">Pending</span>
            <% } else { %>
              <span class="badge bg-success">Shipped</span>
            <% } %>
          </td>
          <td>
            <a href="ManageOrdersServlet?action=assign&orderID=<%= order.getOrderID() %>"
               class="btn btn-sm btn-warning <% if (isShipped) { %> disabled <% } %>">
              Assign Order
            </a>
          </td>
        </tr>
        <%
              }
          }
        %>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
