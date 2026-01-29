<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OderModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pharmacy Admin Panel</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      background-color: #f4f7fd;
      display: flex;
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
      padding: 20px;
    }

    .topbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    .topbar h1 {
      font-size: 24px;
      color: #333;
    }

    .card-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }

    .card {
      background-color: #fff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .card h3 {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .card p {
      font-size: 14px;
      color: #666;
    }

    .chart-placeholder {
      height: 200px;
      background-color: #e8e8f8;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #777;
      font-size: 16px;
    }

    .table-section {
      margin-top: 20px;
    }

    .table-section h3 {
      margin-bottom: 10px;
    }

    .table-section table {
      width: 100%;
      border-collapse: collapse;
    }

    .table-section th, .table-section td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .table-section th {
      background-color: #f1f1ff;
      color: #444;
    }

    .logout-link {
      margin-top: auto;
      color: red;
      font-weight: bold;
    }

    .logout-link:hover {
      color: darkred;
    }

    button.upload-btn {
      padding: 10px 20px;
      background-color: #6a5acd;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    button.upload-btn:hover {
      background-color: #5843bc;
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
    <div class="topbar">
      <h1>Dashboard Overview</h1>
      
    </div>

    <div class="card-container">
      <div class="card">
        <h3>Total Medicines</h3>
        <p>12,345</p>
      </div>
      <div class="card">
        <h3>Total Pharmacists</h3>
        <p>134</p>
      </div>
      <div class="card">
        <h3>Orders Today</h3>
        <p>245</p>
      </div>
      <div class="card">
        <h3>Revenue (Monthly)</h3>
        <p>$28,432</p>
      </div>
    </div>

    <div class="card-container">
      <div class="card">
        <h3>Monthly Sales</h3>
        <div class="chart-placeholder">[Chart Placeholder]</div>
      </div>
      <div class="card">
        <h3>Customer Growth</h3>
        <div class="chart-placeholder">[Chart Placeholder]</div>
      </div>
    </div>

    <div class="table-section">
      <h3>Recent Orders</h3>
      <table>
      
      <tr>
          <th>Order ID</th>
          <th>Address</th>
          <th>Products</th>
          <th>Total (Rs.)</th>
        </tr>
      
      <%
        ArrayList<OderModel> orderList = (ArrayList<OderModel>) request.getAttribute("orders");
        if (orderList != null && !orderList.isEmpty()) {
          for (OderModel order : orderList) {
      %>
        
        <tr>
        <td><%= order.getOrderID() %></td>
        <td><%= order.getAddress() %></td>
      
        
        <td><%= order.getProducts() %></td>
        

        <td><%= order.getTotalPrice() %></td>
       
   
        
      </tr>
      <% 
          } 
        } else { 
      %>
      <tr>
        <td colspan="9" class="text-center">No orders found.</td>
      </tr>
      <% } %>
      </table>
    </div>
  </div>

</body>
</html>
