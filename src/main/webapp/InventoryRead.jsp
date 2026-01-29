<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.InventoryModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pharmacy Inventory Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f7fd;
      display: flex;
    }

    .sidebar {
      width: 250px;
      background-color: #ffffff;
      padding: 20px;
      height: 100vh;
      box-shadow: 2px 0 5px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
    }

    .sidebar h2 {
      color: #6a5acd;
      margin-bottom: 30px;
    }

    .sidebar a {
      text-decoration: none;
      color: #333;
      padding: 10px 0;
      font-size: 16px;
      display: flex;
      align-items: center;
    }

    .sidebar a:hover {
      color: #6a5acd;
    }

    .main-content {
      flex: 1;
      padding: 40px;
    }

    .main-content h1 {
      font-size: 24px;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      overflow: hidden;
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f1f1ff;
      color: #444;
    }

    .btn {
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      display: inline-block;
      margin: 2px;
    }

    .btn-outline-primary {
      color: #007bff;
      border: 1px solid #007bff;
      background-color: transparent;
    }

    .btn-outline-danger {
      color: #dc3545;
      border: 1px solid #dc3545;
      background-color: transparent;
    }

    .btn-outline-primary:hover {
      background-color: #007bff;
      color: white;
    }

    .btn-outline-danger:hover {
      background-color: #dc3545;
      color: white;
    }
  </style>
</head>
<body>
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

  <div class="main-content">
    <h1>📦 Your Inventory Summary</h1>
    <table>
      <thead>
        <tr>
          <th>Medicine ID</th>
          <th>Medicine Name</th>
          <th>Category</th>
          <th>Unit Price</th>
          <th>Quantity</th>
          <th>Prescription Required</th>
          <th>Description</th>
          <th>Expired Date</th>
          <th>Added Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
          ArrayList<InventoryModel> inventArr2 = (ArrayList<InventoryModel>) request.getAttribute("inventory");
          if (inventArr2 != null && !inventArr2.isEmpty()) {
            for (InventoryModel inmod3 : inventArr2) {
        %>
        <tr>
          <td><%= inmod3.getMedicineId() %></td>
          <td><%= inmod3.getMedicineName() %></td>
          <td><%= inmod3.getCategory() %></td>
          <td><%= inmod3.getUnitPrice() %></td>
          <td><%= inmod3.getQuantity() %></td>
          <td><%= inmod3.getPrescriptionRequired() %></td>
          <td><%= inmod3.getdescription() %></td>
          <td><%= inmod3.getExpiryDate() %></td>
          <td><%= inmod3.getAddedDate() %></td>
          <td>
            <a href="InventoryUpdate.jsp?medID=<%= inmod3.getMedicineId()  %>" class="btn btn-outline-primary btn-sm">Update</a>

            <form action="InventoryDeleteServelet" method="post" style="display:inline">
              <input type="hidden" name="medID" value="<%= inmod3.getMedicineId() %>">
              <button type="submit" class="btn btn-outline-danger">Delete</button>
              
            </form>
          </td>
        </tr>
        <% 
            } 
          } else { 
        %>
        <tr>
          <td colspan="10" class="text-center">No medicines found.</td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</body>
</html>
