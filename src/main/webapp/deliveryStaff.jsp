<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.DeliveryStaffModel" %>
<<<<<<< Updated upstream



=======
>>>>>>> Stashed changes
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delivery Staff - PharmaOnline</title>
<<<<<<< Updated upstream
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container py-5">
  <h2 class="mb-4">Delivery Staff Management</h2>

  <table class="table table-bordered table-striped">
    <thead class="table-primary">
      <tr>
        <th>Staff ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Area</th>
        <th>Status</th>
        <th>Notes</th>
        <th>Date</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <%
        ArrayList<DeliveryStaffModel> staffList = (ArrayList<DeliveryStaffModel>) request.getAttribute("staff");
        if (staffList != null && !staffList.isEmpty()) {
          for (DeliveryStaffModel staff : staffList) {
      %>
      <tr>
        <td><%= staff.getStaffID() %></td>
        <td><%= staff.getFirstname() + " " + staff.getLastname() %></td>
        <td><%= staff.getPhone() %></td>
        <td><%= staff.getAssignedArea() %></td>
        <td><span class=""><%= staff.getStatus() %></span></td>
        <td><%= staff.getNotes() %></td>
        <td><%= staff.getDate() %></td>
       
		

        
        
        
        <td>
          <a href="updateDeliveryStaff.jsp?staffID=<%= staff.getStaffID() %>&phone=<%= staff.getPhone() %>&area=<%= staff.getAssignedArea() %>&status=<%= staff.getStatus() %>&notes=<%= staff.getNotes() %>" class="btn btn-sm btn-outline-primary mb-1">Update</a>
          <form action="DeleteDeliveryStaffServlet" method="post" style="display:inline-block">
            <input type="hidden" name="staffID" value="<%= staff.getStaffID() %>">
            <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
          </form>
        </td>
      </tr>
      <% 
          } 
        } else { 
      %>
      <tr>
        <td colspan="8" class="text-center">No Delivery Staff found.</td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp" />

=======
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

    .main-content {
      flex: 1;
      margin-left: 250px;
      padding: 40px 20px;
      width: 100%;
    }

    .logout-link {
      margin-top: auto;
      color: red;
      font-weight: bold;
    }

    .logout-link:hover {
      color: darkred;
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
    <h2 class="mb-4">Delivery Staff Management</h2>
    <a href="addDeliveryStaff.jsp" class="btn btn-success mb-3">➕ Add New Staff</a>

    <table class="table table-bordered table-striped">
      <thead class="table-primary">
        <tr>
          <th>Staff ID</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Area</th>
          <th>Status</th>
          <th>Notes</th>
          <th>Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
          ArrayList<DeliveryStaffModel> staffList = (ArrayList<DeliveryStaffModel>) request.getAttribute("staff");
          if (staffList != null && !staffList.isEmpty()) {
            for (DeliveryStaffModel staff : staffList) {
        %>
        <tr>
          <td><%= staff.getStaffID() %></td>
          <td><%= staff.getFirstname() + " " + staff.getLastname() %></td>
          <td><%= staff.getPhone() %></td>
          <td><%= staff.getAssignedArea() %></td>
          <td><%= staff.getStatus() %></td>
          <td><%= staff.getNotes() %></td>
          <td><%= staff.getDate() %></td>
          <td>
            <a href="updateDeliveryStaff.jsp?staffID=<%= staff.getStaffID() %>&phone=<%= staff.getPhone() %>&area=<%= staff.getAssignedArea() %>&status=<%= staff.getStatus() %>&notes=<%= staff.getNotes() %>" class="btn btn-sm btn-outline-primary mb-1">Update</a>
            <form action="DeleteDeliveryStaffServlet" method="post" style="display:inline-block">
              <input type="hidden" name="staffID" value="<%= staff.getStaffID() %>">
              <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
            </form>
          </td>
        </tr>
        <% 
            } 
          } else { 
        %>
        <tr>
          <td colspan="8" class="text-center">No Delivery Staff found.</td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</div>

>>>>>>> Stashed changes
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
