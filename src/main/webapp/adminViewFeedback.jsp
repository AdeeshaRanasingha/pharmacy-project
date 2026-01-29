<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Feedback" %>
<%@ page import="Services.FeedbackService" %>

<%
    String search = request.getParameter("search");
    List<Feedback> feedbackList = (search != null && !search.trim().isEmpty())
        ? FeedbackService.searchFeedbackById(search)
        : FeedbackService.getAllFeedback();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .header-box {
            background-color: #0d1b2a;
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .table thead {
            background-color: #1b263b;
            color: white;
        }

        .btn-danger {
            background-color: #c1121f;
            border: none;
        }

        .btn-danger:hover {
            background-color: #9b0f17;
        }

        .search-bar input {
            width: 180px;
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
  <div class="container-fluid">
    <!-- Header Section -->
    <div class="header-box d-flex justify-content-between align-items-center px-3 flex-wrap gap-2">
      <h4 class="mb-0"><i class="fas fa-comments"></i> All Messages </h4>
      <form method="get" class="d-flex align-items-center search-bar gap-2 mb-0">
        <input type="number" name="search" class="form-control form-control-sm" placeholder="Search by ID"
               value="<%= search != null ? search : "" %>">
        <button type="submit" class="btn btn-outline-light btn-sm">Search</button>
        <span class="text-light fw-semibold ms-3">
          Total: <%= feedbackList.size() %> Messages<%= feedbackList.size() == 1 ? "" : "s" %>
        </span>
      </form>
    </div>

    <!-- Alerts -->
    <%
      String status = request.getParameter("status");
      if ("deleted".equals(status)) {
    %>
    <div id="feedbackAlert" class="alert alert-danger text-center">
      <i class="fas fa-trash-alt"></i> Message Deleted Successfully!
    </div>
    <% } %>

    <!-- Table -->
    <table class="table table-bordered table-hover text-center">
      <thead>
        <tr>
          <th>Msg-ID</th>
          <th>User's ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Message</th>
          <th>Submitted Time</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
          if (feedbackList.isEmpty()) {
        %>
        <tr>
          <td colspan="8" class="text-center text-danger fw-semibold">
            <i class="fas fa-exclamation-circle"></i> No Messages found for the search term "<%= search %>".
          </td>
        </tr>
        <%
          } else {
            for (Feedback fb : feedbackList) {
        %>
        <tr>
          <td><%= fb.getId() %></td>
          <td><%= fb.getUserID() %></td>
          <td><%= fb.getFirstname() + " " + fb.getLastname() %></td>
          <td><%= fb.getEmail() %></td>
          <td><%= fb.getPhone() %></td>
          <td><%= fb.getMessage() %></td>
          <td><%= fb.getSubmittedAt() %></td>
          <td>
            <a href="adminDeleteFeedback?id=<%= fb.getId() %>" class="btn btn-sm btn-danger"
               onclick="return confirm('Are you sure you want to delete this Message?');">
              <i class="fas fa-trash-alt"></i> Erase
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

<!-- Auto-hide alert JS -->
<script>
  setTimeout(function () {
    const alert = document.getElementById("feedbackAlert");
    if (alert) {
      alert.style.display = "none";
      const url = new URL(window.location);
      url.searchParams.delete("status");
      window.history.replaceState({}, document.title, url);
    }
  }, 1500);
</script>

</body>
</html>
