<%@ page import="Model.UserModel" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Retrieve user object from session
    UserModel user = (UserModel) session.getAttribute("user");

    // Redirect if user is not logged in or is not an admin
    if (user == null || !"admin".equalsIgnoreCase(user.getUsertype())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
    
    .col-md-4{
    
    margin-bottom: 20px;
    
    }
    
    </style>
    
</head>
<body class="bg-light">

    <!-- Header Section -->
    <jsp:include page="header.jsp" />

    <div class="container mt-5">
        <!-- Admin Info Section -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h2>Welcome, <%= user.getFirstname() %> (Admin)</h2>
                    </div>
                    <div class="card-body">
                        <p><strong>Email:</strong> <%= user.getEmail() %></p>
                        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Admin Functions Section -->
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-header bg-secondary text-white">
                        <h4>Admin Dashboard</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="mb-4">Admin Functions</h5>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="" class="text-decoration-none">Manage Users</a>
                                <p class="text-muted">View, update or delete users (customers).</p>
                            </li>
                            <li class="list-group-item">
                                <a href="DeliveryStaffListServlet" class="text-decoration-none">Manage Delivery Staff</a>
                                <p class="text-muted">Add or remove delivery staff.</p>
                            </li>
                            <li class="list-group-item">
                                <a href="" class="text-decoration-none">View Reports</a>
                                <p class="text-muted">Access sales and order reports.</p>
                            </li>
                            <li class="list-group-item">
                                <a href="ManageOrdersServlet" class="text-decoration-none">Manage Orders</a>
                                <p class="text-muted">Assigned Orders</p>
                            </li>
                            <li class="list-group-item">
                                <a href="LogoutServlet" class="text-decoration-none text-danger">Logout</a>
                                <p class="text-muted">Logout from the admin panel.</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Stats Section -->
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card bg-light shadow">
                    <div class="card-body">
                        <h5>Total Users</h5>
                        <% Integer totalUsers = (Integer) request.getAttribute("getTotalUsers"); %>
<% if (totalUsers != null) { %>
    <p>Total Registered Users: <%= totalUsers %></p>
<% } else { %>
    <p>No user count available.</p>
<% } %>
                        
                        <h3></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light shadow">
                    <div class="card-body">
                        <h5>Total Orders</h5>
                        <h3></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light shadow">
                    <div class="card-body">
                        <h5>Pending Deliveries</h5>
                        <h3></h3>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Footer Section -->
    <jsp:include page="footer.jsp" />

    <!-- Optional: Bootstrap and FontAwesome JS for Interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
