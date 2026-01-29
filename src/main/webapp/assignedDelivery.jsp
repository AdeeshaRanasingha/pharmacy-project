<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Model.DeliveryStaffModel" %>

<%
   int orderID = Integer.parseInt(request.getParameter("orderID"));
   List<DeliveryStaffModel> activeStaffList = (List<DeliveryStaffModel>) request.getAttribute("activeStaffList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Assign Order</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

    .card {
      border-radius: 12px;
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
    <div class="card shadow p-4">
      <h2 class="mb-4 text-primary">Assign Delivery Staff to Order No <%= orderID %></h2>

      <form method="post" action="ManageOrdersServlet">
        <input type="hidden" name="orderID" value="<%= orderID %>">

        <div class="mb-3">
          <label for="staffID" class="form-label">Select Delivery Staff:</label>
          <select name="staffID" id="staffID" class="form-select form-select-sm" required>
            <% if (activeStaffList != null && !activeStaffList.isEmpty()) {
                 for (DeliveryStaffModel staff : activeStaffList) { %>
              <option value="<%= staff.getStaffID() %>">
                <%= staff.getFirstname() + " " + staff.getLastname() %>
              </option>
            <%   } 
               } else { %>
              <option disabled>No active delivery staff available</option>
            <% } %>
          </select>
        </div>

        <button type="submit" class="btn btn-primary btn-sm">
          <i class="fas fa-check-circle"></i> Assign
        </button>
      </form>
    </div>
  </div>
</div>

</body>
</html>
